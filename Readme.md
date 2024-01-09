# Deploying a Go Server to AWS Lambda

This repository provides a simple guide and example code for deploying a Go server to AWS Lambda. By leveraging AWS Lambda, you can host your Go application with minimal infrastructure management and cost.


![a-removebg-preview](https://github.com/swarajkumarsingh/aws-lambda-go/assets/89764448/501bcd84-3b45-41ef-b7f0-e979199062ee)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Building the Go Server](#building-the-go-server)
- [Deploying to AWS Lambda](#deploying-to-aws-lambda)
- [Testing](#testing)
- [Clean-Up](#clean-up)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, make sure you have the following installed and set up:

- [Go](https://golang.org/doc/install)
- [Serverless CLI](https://www.serverless.com/framework/docs/getting-started)

## Getting Started

Clone this repository to your local machine:

```bash
git clone https://github.com/swarajkumarsingh/aws-lambda-go.git
cd aws-lambda-go
```

## Building the Go Server
Build your Go server binary:

```
make build
```

```
make build-windows (for windows optional)
```

## Configuration
serverless.yml - file contains all configs related to deployment options
```
service: serverless-rest-api-3
frameworkVersion: '>=1.28.0'
provider:
  name: aws
  runtime: go1.x
  stage: ${opt:stage, 'dev'}
  region: ap-south-1

functions:
  api:
    handler: bin/main
    events:
      - http:
          path: /ping
          method: get
          cors: true
      
package:
  patterns:
    - '!*/**'
    - bin/main
```

## Deploying to AWS Lambda
Use serverless cli for deploying
```
make deploy(this will build the project and deploy it)
``` 

## Testing
After you deploy, you will be given a url
```
curl <give-url>
``` 

## Clean-Up
```
- Head to your AWS console
- Search 'CloudFormation'
- Select your stack via name
- Delete it
- Verify this, by going to lambda make sure there is no running lambda function via your project name
```

## Contributing
If you find any issues or have improvements, feel free to open an issue or submit a pull request. Contributions are welcome!

## License
This project is licensed under the MIT License - see the LICENSE file for details.
