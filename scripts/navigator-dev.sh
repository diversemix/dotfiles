#!/bin/bash

export NAV_HOME=/home/peter/work/navigator
cd ${NAV_HOME}

# Pull in the default env
export $(cat .env|xargs)

export BACKEND_DATABASE_URL="postgresql://${BACKEND_POSTGRES_USER}:${BACKEND_POSTGRES_PASSWORD}@backend_db:5432/${BACKEND_POSTGRES_USER}"
export LOADER_DATABASE_URL=postgresql://${LOADER_POSTGRES_USER}:${LOADER_POSTGRES_PASSWORD}@loader_db:5432/${LOADER_POSTGRES_USER}
export DATABASE_URL=postgresql://navigator:password@backend_db:5432/navigator

# Link in the models folder
ln -s /opt/models/ $PWD/backend/models
export INDEX_ENCODER_CACHE_FOLDER=./models

# Run the local app
cd backend
PYTHONPATH=$PWD python app/main.py
