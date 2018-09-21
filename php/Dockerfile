FROM circleci/php:7.1-browsers

MAINTAINER Wilson McCoubrey

RUN sudo apt-get update && sudo apt-get install python-pip python-dev jq && rm -rf /var/lib/apt/lists/*
RUN sudo pip install awscli