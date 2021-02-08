#!/bin/bash

docker-compose -f postgres/docker-compose.yaml down
docker-compose -f airflow/docker-compose.yaml down
docker-compose -f r-base/docker-compose.yaml down
