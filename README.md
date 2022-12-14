# README
Ruby on rails, postgres and docker

* Local development
```
cp .env.example .env
docker compose build
docker compose up

docker compose run --rm web bin/rails db:create
docker compose run --rm web bin/rails db:migrate
docker compose run --rm web bin/rails data:import_trucks
docker compose run --rm web bundle exec rspec
```
* Production deployment

Build docker image and deploy to any cloud (AWS or GCP).

Environment variables:

```
DB_HOST=db
DB_USERNAME=postgres
DB_PASSWORD=password
DB_PORT=5432
```
