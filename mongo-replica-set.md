# generate keyfile
openssl rand -base64 756 > ast_mongo.key

# add generated key to docker image (Dockerfile) and build it
ADD ./ast_mongo.key /data/ast_mongo.key

# use generated key on docker-compose
services:
  mongo:
    command: --bind_ip_all --keyFile /data/ast_mongo.key --replSet ast-replica-set

# initialize replica set (all nodes must be up)
rs.initiate(
  {
    _id : 'ast-replica-set',
    members: [
      { _id : 0, host : 'mongo-primary:27017' },
      { _id : 1, host : 'mongo-arbiter:27017', arbiterOnly: true },
      { _id : 2, host : 'mongo-secondary:27017' }
    ]
  }
);

# check config
rs.conf()

# reconfigure, incremenet protocolVersion
rs.reconfig(
  {
    _id : 'ast-replica-set',
    protocolVersion: 1,
    members: [
      { _id : 0, host : 'mongo-primary:27017' },
      { _id : 1, host : 'mongo-arbiter:27017', arbiterOnly: true },
      { _id : 2, host : 'mongo-secondary:27017' }
    ]
  },
  { force: true }
);

# add to replica set
rs.add('127.0.0.1:27017');
rs.add('mongo3:27017');

# remove replica set
rs.remove('127.0.0.1:27017');

# add arbiter (node that does voting but not storing data)
rs.addArb('m1.example.net:27017');

# get rs status
rs.status()

# set slave = true on secondary node before reading data
rs.slaveOk()

# create users
TODO

# backup container
docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

# bash into container
docker exec -it some-mongo bash

# get container logs
docker logs some-mongo
