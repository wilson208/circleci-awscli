# circleci-awscli
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg?style=flat-square&maxAge=3600)](https://hub.docker.com/r/wilson208/circleci-awscli/)
[![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg?style=flat-square&maxAge=3600)](https://hub.docker.com/r/wilson208/circleci-awscli/)

Basic public docker image for use in circleci jobs to deploy to AWS services

## Available Variants
circleci-awscli:latest - circleci/node:7.10.1 Based image
circleci-awscli:node - circleci/node:7.10.1 Based image
circleci-awscli:php - circleci/php:7.1-browsers Based image


## What is included?
- [aws cli](https://aws.amazon.com/cli/)
- [jq](https://stedolan.github.io/jq/)
- [serverless cli](https://serverless.com/)


## Example Usage
### Syncing a folder to an S3 Bucker
```  yaml
deploy-to-s3:
    docker:
      - image: wilson208/circleci-awscli

    environment:
      AWS_ACCESS_KEY_ID: ********
      AWS_SECRET_ACCESS_KEY: ********
      AWS_DEFAULT_REGION: ********

    steps:
      - restore_cache:
          keys:
            - source

      - checkout

      - run: aws s3 cp ./src/public/static s3://my-s3-bucket/ --recursive
```

### Deploying a pkg to a lambda function
``` yaml
deploy-to-lambda:
    docker:
      - image: wilson208/circleci-awscli

    environment:
      AWS_ACCESS_KEY_ID: ********
      AWS_SECRET_ACCESS_KEY: ********
      AWS_DEFAULT_REGION: ********

    steps:
      - restore_cache:
          keys:
            - source

      - checkout

      - run: aws lambda update-function-code --function-name [my-function] --zip-file fileb://lambda_pkg.zip
      - run: version=`aws lambda publish-version --function-name [my-function] | jq -r .Version` && aws lambda update-alias --function-name [my-function] --function-version $version --name [my-version-alias]

```

