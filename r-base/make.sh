#!/bin/bash

cp ../.Renviron .Renviron
cp ../renv.lock renv.lock
cp -r ../sql .
docker-compose build
