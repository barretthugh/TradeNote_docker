docker image for TradeNote https://github.com/Eleven-Trading/TradeNote

## edit the env file to match your environment and rename to env.env:
```
MONGO_URL=mongodb
MONGO_PORT=27017
MONGO_USER=mongo_user
MONGO_PASSWORD=mongo_pwd
TRADENOTE_DATABASE=tradenotedb
APP_ID=APP_ID
MASTER_KEY=MASTER_KEY
TRADENOTE_PORT=7777
```


## deployment (wait at least 1 minute for services up and data creation):
```
1. create volume for mongodb
    docker volume create tradenotedb

2. start up
    docker-compose up -d
```

## stop/remove containers:
```
1. docker-compose stop

2. docker-compose rm
```

## update:
```
docker-compose down

docker rmi barretthugh/tradenote

docker-compose up -d
```

## database backup:
```
1. docker-compose stop

2.
docker run  --rm -v tradenotedb:/data/db \
-v $(pwd):/backup alpine \
tar zcvf /backup/dbbackup.tar /data/db

3. docker-compose up -d
```


## database restore:
```
1. docker-compose stop

2.
docker run  --rm -v tradenotedb:/data/db \
-v $(pwd):/backup alpine \
sh -c "cd /data/db \
&& rm -rf diagnostic.data \
&& rm -rf journal \
&& rm -rf configdb \
&& cd / \
&& tar xvf /backup/dbbackup.tar"

3. docker-compose up -d
```
