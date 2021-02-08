#!/bin/bash

cp .Renviron ./r-base/.Renviron
cp renv.lock ./r-base/renv.lock
cp main.R ./r-base/main.R
rm -r ./r-base/sql
cp -r sql ./r-base/
docker-compose -f r-base/docker-compose.yaml build
