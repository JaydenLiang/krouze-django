# remove all stopped docker containers
docker rm $(docker ps -a -q)

# create a project (especially for the first time)
# make sure to run all services before create a project
# project will mount with the current directory so please specify the absolute path in the docker-compose.yml
sudo docker-compose run -v ./web_data:/usr/src/app web django-admin.py startproject <PROJECT_NAME> .

# modify the web_data/<PROJECT_NAME>/settings.py add your domain to the ALLOWED_HOSTS

ALLOWED_HOSTS = ['<YOUR_DOMAIN_HERE>']

# modify the web_data/<PROJECT_NAME>/settings.py
# comment out these lines
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }

# add theses lines to use postgres database
# the HOST refers to the service name defined in the docker-compose.yml file.
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'postgres',
        'PORT': 5432,
    }
}

# turn on the service
# attached
docker-compose up
# detachted
docker-compose up -d