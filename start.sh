#!/bin/sh

set -e


docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml run --service-ports --rm app foreman start