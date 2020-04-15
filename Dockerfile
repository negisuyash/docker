version: '3'

networks:
  lan:

services:

  core1:
    image: neo4j:3.1.0-enterprise
    networks:
      - lan
    ports:
      - 7000:7474
      - 7001:6477
      - 7002:7687
    volumes:
      - $PWD/neo4j/neo4j-core1/conf:/conf
      - $PWD/neo4j/neo4j-core1/data:/data
      - $PWD/neo4j/neo4j-core1/logs:/logs
      - $PWD/plugins:/plugins
    environment:
#      - NEO4J_AUTH=none
      - NEO4J_AUTH=neo4j/admin
      - NEO4J_dbms_mode=SINGLE
      - NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
      - NEO4J_causalClustering_expectedCoreClusterSize=2
      - NEO4J_causalClustering_initialDiscoveryMembers=core1:5000
      - NEO4J_dbms_connector_http_listen__address=:7474
      - NEO4J_dbms_connector_https_listen__address=:6477
      - NEO4J_dbms_connector_bolt_listen__address=:7687
