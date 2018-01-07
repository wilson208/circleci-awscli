# circleci-awscli

Basic public docker image based on circleci/node:7.10.1 for use in circleci jobs to deploy to AWS services

## What is included?
- [aws cli](https://aws.amazon.com/cli/)
- [jq](https://stedolan.github.io/jq/)


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

