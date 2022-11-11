docker image for TradeNote https://github.com/Eleven-Trading/TradeNote

## build TradeNote image:
```
docker build . -t tradenote
```

## deployment (wait at least 1 minute for services up and data creation):
```
1. create volume for mongodb
    docker volume create tradenotedb

2. start up with parse-dashboard
    docker-compose up -d

  or without parse-dashboard
    docker-compose -f docker-compose-without-dashboard.yaml up -d
```

## stop/remove container:
```
1. docker-compose stop

2. docker-compose rm
```

## update:
```
docker-compose down

docker build . -t tradenote

docker-compose up -d
```

## database backup:
```
1. docker-compose stop

2.
docker run  --rm -v tradenotedb:/data/db \
-v $(pwd):/backup alpine \
tar zcvf /backup/dbbackup.tar /data/db
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
```
