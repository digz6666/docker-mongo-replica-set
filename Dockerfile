FROM mongo:4.0.9

RUN apt update && apt -y upgrade && apt -y install iputils-ping

ADD ./ast_mongo.key /data/ast_mongo.key
# ADD ./mongo-scripts/test.sh /docker-entrypoint-initdb.d/test.sh

RUN chown 999:999 /data/ast_mongo.key
RUN chmod 600 /data/ast_mongo.key
