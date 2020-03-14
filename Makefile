all: build run

build-frontend:
	docker build -t frontend frontend

build-backend:
	docker build -t backend backend

build: build-frontend build-backend

run: 
	docker-compose up

firebase-deploy:
	cd frontend/vuetify-pwa-firebase-python-template/ && firebase deploy --only hosting:vue-example-template

# TESTING COMMANDS
test-backend:
	make build-backend
	docker-compose -f docker-compose-backend.yaml up

serve-frontend:
	cd frontend/vuetify-pwa-firebase-python-template/ && yarn serve

serve-backend:
	cd backend/ && uvicorn main:app --reload

install:
	npm install -g firebase-tools
