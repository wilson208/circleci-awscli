FROM circleci/node:10

MAINTAINER Wilson McCoubrey

RUN sudo apt-get update && sudo apt-get install python-pip python-dev jq
RUN sudo npm install -g serverless npm@latest
RUN sudo pip install awscli