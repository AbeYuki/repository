# command
```bash
docker-compose run web rails new . --force --database=postgresql && \
echo '########## RUN COMPLETE ##########' && \
docker-compose build && \
echo '########## BUILD COMPLETE ##########' && \
sed -i -e 's/encoding: unicode/encoding: unicode\n  host: db\n  username: postgresql\n  password: postgresqlpassword/' config/database.yml && \
echo '########## DB CONFIGUER COMPLETE ##########' && \
docker-compose up -d && \
echo '########## COMPOSE UP COMPLETE ##########' && \
docker-compose run web rails db:create
echo '########## DB CREATE COMPLETE ##########' && \
echo '########## ALL COMPLETE ##########'
```