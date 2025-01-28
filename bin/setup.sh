#!/bin/bash
cd prometheus
./write_target.sh ${API_URL}
./write_target.sh ${CLIENT_URL}
docker-compose -f ../docker-compose-prometheus.yml up