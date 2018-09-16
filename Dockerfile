FROM circleci/node:7.10.1

MAINTAINER Wilson McCoubrey

RUN sudo apt-get update
RUN sudo apt-get install python-pip python-dev jq
RUN sudo apt-get install -g serverless
RUN sudo pip install awscli