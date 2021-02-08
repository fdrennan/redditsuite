#!/bin/bash

cp .Renviron ./r-base/
cp renv.lock ./r-base/
cp main.R ./r-base/
cp -r sql ./r-base/
cp plumber.R ./r-base/

echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > airflow/.env

docker-compose -f airflow/docker-compose.yaml down
docker-compose -f r-base/docker-compose.yaml down

docker-compose -f airflow/docker-compose.yaml up airflow-init
docker-compose -f r-base/docker-compose.yaml build

docker-compose -f airflow/docker-compose.yaml up -d
docker-compose -f r-base/docker-compose.yaml up -d
