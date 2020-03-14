import logging
logging.basicConfig(
    level=2,
    format="[%(asctime)s][SELF] [%(levelname)s] %(message)s"
)

from fastapi import FastAPI
import firebase_admin as fb
from firebase_admin import credentials

try:
    cred = credentials.Certificate("secrets.json")
    fb.initialize_app(cred)
    logging.info("Successfully connected to Firebase as Admin.")
except Exception as e:
    logging.warning("Could not connect to Firebase as admin. Malformed credentials? Secrets must be in the same folder as app.")


app = FastAPI()
@app.get("/")
def read_root():
    return {"Hello": "World"}

