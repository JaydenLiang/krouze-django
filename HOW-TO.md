# remove all stopped docker containers
docker rm $(docker ps -a -q)

# create a project (especially for the first time)
# make sure to run all services before create a project
# project will mount with the current directory so please specify the absolute path in the docker-compose.yml
sudo docker-compose run -v ./web_data:/usr/src/app web django-admin.py startproject <PROJECT_NAME> .

# turn on the service
# attached
docker-compose up
# detachted
docker-compose up -d