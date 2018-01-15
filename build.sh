#!/usr/bin bash
mkdir postgres_data
mkdir redis_data
mkdir web_data
sudo docker-compose run -v ./web_data:/usr/src/app web django-admin.py startproject myproject .