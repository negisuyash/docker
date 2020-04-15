# docker
docker files and docker yml files for data migration (AUTOMATION AND DEVOPS)


 <---------------------------------------------NEO4J CLUSTER AND DATA MIRGATION-------------------------------------------->


Step 1: scp neo4j/data/databases/graph.db files and docker-compose.yml from source machine to destination machine

Step 2: now run docker-compose file using command: -> $ docker-compose up -d

Step 3: delete the auto generated files by docker-compose file and replace graph.db with old graph.db i.e. make replacement of these files for all the nodes.

Step 4: now recreate the containers and neoj clusters are ready with migrated data.



 <-------------------------------------------MONGODB CLUSTER AND DATA MIRGATION-------------------------------------------->


Step 1: Prepare docker-compose.yml file or scp that file from source machine to destination machine.


Step 2: execute the mongodb docker container (one of them if cluster) using following command:
        
        -> $ docker exec -it <name_of_container> bash
        
        and then dump all the data there using :  -> $ mongodump -o /dump/

        then -> $ exit

Step 3: Copy dump from docker container to source machine : -> $ docker cp <name_of_container>:/dump .

Step 4: scp that data to destination machine and set up docker/docker-compose and pull mongo in that machine.  

Step 5: Create containers in new machine using docker-compose.yml file : -> $ docker-compose up -d

Step 6: copy that dump file present in destination machine to one of the docker container just created by docker-compose file.
 
        -> $ docker cp /dump <name_of_container>:/

Step 7: execute that docker container with bash : -> $ docker exec -it <name_of_container> bash

Step 8: run this command for making a connection : -> $ db = (new Mongo('localhost:27017')).getDB('<name_of_db>')

Step 9: write configuration for all the nodes, Configuration such as follows: -> $ config = {
												  "_id": "comments",
												  "members": [
    														{
      														   "_id": 0,
														   "host": "node1:27017"
    														},
    														{
      														   "_id": 1,
   														   "host": "node2:27017"
    														},
    														{
   														   "_id": 2,
   														   "host": "node3:27017"
    														}
  													     ]
											     }
											     
Step 10: run command using rs.initiate(config)

Step 11: restore that mongo dump in this container: -> $ monogorestore --drop --db <name_of_db> /dump/<name_of_db>  // in our case name of db is qfrog

