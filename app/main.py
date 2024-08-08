from fastapi import FastAPI
from datetime import datetime

app = FastAPI()


@app.get("/time")
def get_time():
    return {"time": datetime.now().strftime("%Y-%m-%d %H:%M:%S")}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/version")
def version():
    return {"version": "0.1.0"}
