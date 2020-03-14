FROM tiangolo/uvicorn-gunicorn:python3.7

ENV PORT 8080

RUN pip install fastapi pyrebase firebase-admin

COPY ./app /app
