#!/bin/bash

cp .Renviron ./r-base/
cp renv.lock ./r-base/
cp main.R ./r-base/
cp -r sql ./r-base/
cp plumber.R ./r-base/
rm airflow/.env

echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > airflow/.env

mkdir --mode=777 -p airflow/plugins airflow/logs airflow/dags
# sudo chmod 777 airflow/plugins airflow/logs airflow/dags
# sudo chmod 777 airflow/plugins
# sudo chmod 777 airflow/logs
# sudo chmod 777 airflow/dags

docker-compose -f postgres/docker-compose.yaml down --remove-orphans
docker-compose -f airflow/docker-compose.yaml down
docker-compose -f r-base/docker-compose.yaml down --remove-orphans

# docker-compose -f airflow/docker-compose.yaml up airflow-init
docker-compose -f r-base/docker-compose.yaml build

docker-compose -f postgres/docker-compose.yaml up -d
docker-compose -f airflow/docker-compose.yaml up -d --remove-orphans
docker-compose -f r-base/docker-compose.yaml up -d
