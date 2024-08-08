from fastapi import FastAPI
from datetime import datetime

app = FastAPI()


@app.get("/time")
def get_time():
    return {"time": datetime.now().strftime("%Y-%m-%d %H:%M:%S")}

@app.get("/hello")
def get_time():
    return {"tata"}
