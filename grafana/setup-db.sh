#!/bin/bash
docker exec -it postgres psql -U postgres -c 'drop table if exists tests'
docker exec -it postgres psql -U postgres -c 'create table if not exists tests (run_id varchar(50) PRIMARY KEY, LLM varchar(100), latency float, tokens integer,  time timestamp not null, error boolean, eval json)'
docker cp runs.csv postgres:/tmp/runs.csv
docker exec -it postgres psql -U postgres -c "copy tests from '/tmp/runs.csv' WITH (FORMAT csv, ESCAPE '\', header);"
docker exec -it postgres psql -U postgres -c "select count(*) from tests"