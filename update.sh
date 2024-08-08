#!/bin/bash

# Nom de l'image et du conteneur
IMAGE_NAME="fastapi-image"
CONTAINER_NAME="fastapi-container"

# Fonction pour arrêter et supprimer le conteneur
stop_and_remove_container() {
    if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
        echo "Arrêt et suppression du conteneur existant..."
        docker stop $CONTAINER_NAME
        docker rm $CONTAINER_NAME
    else
        echo "Aucun conteneur à supprimer."
    fi
}

# Fonction pour supprimer les images fastapi-image
remove_images() {
    echo "Suppression des images $IMAGE_NAME..."
    docker images -q $IMAGE_NAME | xargs docker rmi -f
}

# Fonction pour construire la nouvelle image
build_image() {
    echo "Construction de la nouvelle image..."
    docker build -t $IMAGE_NAME:latest .

    if [ $? -eq 0 ]; then
        echo "Image construite avec succès."
    else
        echo "Erreur lors de la construction de l'image."
        exit 1
    fi
}

# Fonction pour exécuter un nouveau conteneur
run_container() {
    echo "Exécution du nouveau conteneur..."
    docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME:latest

    if [ $? -eq 0 ]; then
        echo "Conteneur exécuté avec succès."
    else
        echo "Erreur lors de l'exécution du conteneur."
        exit 1
    fi
}

# Vérifier les mises à jour sur le dépôt distant
git remote update > /dev/null 2>&1

# Vérifier si des modifications sont disponibles
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Le dépôt local est à jour avec le dépôt distant."
elif [ $LOCAL = $BASE ]; then
    echo "Des modifications sont disponibles. Pull en cours..."
    git pull

    # Exécuter les commandes après le pull
    stop_and_remove_container
    remove_images
    build_image
    run_container
elif [ $REMOTE = $BASE ]; then
    echo "Vous avez des commits locaux non poussés."
else
    echo "Le dépôt local et le dépôt distant ont divergé."
fi
