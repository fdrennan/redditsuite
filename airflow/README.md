Source - https://youtu.be/aTaytcxy2Ck

curl -Lf0 'http://apache-airflow-docs.s3-website.eu-central-1.amazonaws.com/docs/apache-airflow/latest/docker-compose.yaml'

echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

mkdir dags plugins logs

docker-compose up airflow-init

docker exec (container id) airflow version

curl -X GET --user "airflow"airflow" http://localhost:8080/api/v1/dags"
IRFLOW__API__AUTH_BACKEND: 'airflow.api.auth.backend.basic_auth'


docker system prune

docker exec -it airflow_airflow-scheduler_1 bash

