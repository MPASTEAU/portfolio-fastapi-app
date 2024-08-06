from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_get_time():
    response = client.get("/time")
    assert response.status_code == 200
    assert "time" in response.json()
