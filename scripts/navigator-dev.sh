#!/bin/bash


# Pull in the default env
export $(cat .env|grep -v "^#" | xargs)

export BACKEND_DATABASE_URL="postgresql://${BACKEND_POSTGRES_USER}:${BACKEND_POSTGRES_PASSWORD}@localhost:5432/${BACKEND_POSTGRES_USER}"
export LOADER_DATABASE_URL=postgresql://${LOADER_POSTGRES_USER}:${LOADER_POSTGRES_PASSWORD}@loader_db:5432/${LOADER_POSTGRES_USER}
export DATABASE_URL=${BACKEND_DATABASE_URL}

# Link in the models folder
[ ! -d $PWD/backend/models ] && ln -s /opt/models/ $PWD/backend/models
export INDEX_ENCODER_CACHE_FOLDER=./models

unset AWS_SECRET_ACCESS_KEY
unset AWS_ACCESS_KEY_ID

# Run the local app
cd backend
echo PYTHONPATH=$PWD python app/main.py
