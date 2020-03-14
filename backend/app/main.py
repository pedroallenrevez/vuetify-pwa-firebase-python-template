from fastapi import FastAPI
import firebase_admin as fb
from firebase_admin import credentials

app = FastAPI()

cred = credentials.Certificate("secrets.json")
fb.initialize_app(cred)

@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}