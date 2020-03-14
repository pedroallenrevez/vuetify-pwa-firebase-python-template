# ============================ DEPLOY ===============================
build:
	cd frontend/vuetify-pwa-firebase-python-template/ && \
	yarn build

firebase-deploy:
	cd frontend/vuetify-pwa-firebase-python-template/ && \
	firebase deploy 

deploy: build firebase-deploy

# ============================ DOCKER ===============================
test: build-images run-docker
build-images: build-image-frontend build-image-backend
build-image-frontend:
	docker build -t frontend frontend
build-image-backend:
	docker build -t backend backend

run-docker: 
	docker-compose up
test-backend:
	make build-image-backend
	docker-compose -f docker-compose-backend.yaml up

# ============================ LIVE TEST ===============================
serve-frontend:
	cd frontend/vuetify-pwa-firebase-python-template/ && \
	yarn serve

serve-backend:
	cd backend/ && \
	uvicorn main:app --reload

install:
	npm install -g firebase-tools
