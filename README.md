# Portfolio FastAPI App

This repository contains the code for a FastAPI application as part of my portfolio. It demonstrates best practices in developing web services, containerization with Docker.

## Prerequisites

- Python 3.12 or later
- Docker
- Git

## Setup

### Installing Pre-commit

To ensure code quality and consistency, this project uses pre-commit hooks. Follow the steps below to install and configure pre-commit:

1. Install pre-commit:
   ```sh
   pip install pre-commit==3.8.0
   ```

2. Install pre-commit hooks:
   ```sh
   pre-commit install
   ```

3. To run the pre-commit hooks on all files:
   ```sh
   pre-commit run --all-files
   ```

### Installing Docker

Docker is used for containerization of the application. Follow the [official Docker installation guide](https://docs.docker.com/engine/install/) to install Docker on your system.

## Building and Running the Docker Image

To build and run the Docker image for this application, follow these steps:

1. Build the Docker image:
   ```sh
   docker build -t portfolio-fastapi-app:v1.0.0 .
   ```

2. Run the Docker container:
   ```sh
   docker run -d -p 8000:8000 portfolio-fastapi-app:v1.0.0
   ```

## Usage

Once the application is running, you can access the API documentation at:
```
http://localhost:8000/docs
```

## Contributing

If you wish to contribute to this project, please fork the repository and create a new branch for your feature or bug fix. Make sure to write tests for your changes and ensure that all pre-commit hooks pass before submitting a pull request.

## License

This project is licensed under the MIT License.

MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
