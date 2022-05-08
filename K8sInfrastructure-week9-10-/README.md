# CI-CD-WeightTracker-k8S ![image](https://user-images.githubusercontent.com/89352211/142737603-a00b2530-e159-4d80-9636-b23cc0cb1ec1.png)

## Requirements:

- Install on Docker the [bootcamp-app_week10](https://github.com/lihaybs/bootcamp-app_week10.git) from here : </br>
- Node.js 12.x or higher
- Configure an agent: [agent-pool](https://www.youtube.com/watch?v=psa8xfJ0-zI&ab_channel=Raaviblog)
- PostgreSQL (Get in SSH to your Agent and after all run "npm run initdb")
- Free Okta developer account for account registration, login

## Steps:

- Deploy the NodeWeightTracker application on AKS meeting the following requirements:

* The NodeWeightTracker application must be accessible from the internet
* The NodeWeightTracker application must be exposed to the internet on port 80
* The NodeWeightTracker must have at least 3 instances to ensure high availability
* Use configmaps/secrets to store your application configurations
* You must expose your application using the ingress controller

- CI \ CD process using "Azure DevOps Organizations"
- The CI-CD process contained: "Build and push an image to container registry"
- Create imagePullSecret With secretArguments:

'--from-literal=COOKIE_ENCRYPT_PWD=$(COOKIE_ENCRYPT_PWD) --from-literal=HOST=$(HOST) --from-literal=PORT=$(PORT) --from-literal=NODE_ENV=$(NODE_ENV) --from-literal=HOST_URL=$(HOST_URL) --from-literal=OKTA_CLIENT_ID=$(OKTA_CLIENT_ID) --from-literal=OKTA_CLIENT_SECRET=$(OKTA_CLIENT_SECRET) --from-literal=OKTA_ORG_URL=$(OKTA_ORG_URL) --from-literal=PGHOST=$(PGHOST) --from-literal=PGUSERNAME=$(PGUSERNAME) --from-literal=PGDATABASE=$(PGDATABASE) --from-literal=PGPASSWORD=$(PGPASSWORD) --from-literal=PGPORT=$(PGPORT)'

- Deploy to Kubernetes cluster:
  $(azure-k8s-pippeline.Workspace)/deployment.yml
  $(azure-k8s-pippeline.Workspace)/service.yml
  $(azure-k8s-pippeline.Workspace)/ingress.yml
- Kubectl Apply to deployment.yml
- Run the pipeline and check that your applications are running :)

# The full process:

![image](https://user-images.githubusercontent.com/71599740/142738639-068572f2-c29b-4b4f-92d3-e6c316064c8d.png)

![image](https://user-images.githubusercontent.com/47865329/142753458-0083b2b4-7bb7-4ebc-8df1-1173d5a2311b.png)

# Project structure

![image](https://user-images.githubusercontent.com/89352211/142737633-c7e2a8fb-956d-489d-bafa-8886fecfa515.png)
![image](https://user-images.githubusercontent.com/89352211/142737732-ec01d94f-384e-4405-b6c4-7b2cb4be5b56.png)

## The result:

![image](K8sInfrastructure-week9-10-/weight-tracker.png)

## Node.js Weight Tracker

![Demo](docs/build-weight-tracker-app-demo.gif)

This sample application demonstrates the following technologies.

- [hapi](https://hapi.dev) - a wonderful Node.js application framework
- [PostgreSQL](https://www.postgresql.org/) - a popular relational database
- [Postgres](https://github.com/porsager/postgres) - a new PostgreSQL client for Node.js
- [Vue.js](https://vuejs.org/) - a popular front-end library
- [Bulma](https://bulma.io/) - a great CSS framework based on Flexbox
- [EJS](https://ejs.co/) - a great template library for server-side HTML templates

**Requirements:**

- [Node.js](https://nodejs.org/) 12.x or higher
- [PostgreSQL](https://www.postgresql.org/) (can be installed locally using Docker)
- [Free Okta developer account](https://developer.okta.com/) for account registration, login

## Install and Configuration

1. Clone or download source files
1. Run `npm install` to install dependencies
1. If you don't already have PostgreSQL, set up using Docker
1. Create a [free Okta developer account](https://developer.okta.com/) and add a web application for this app
1. Copy `.env.sample` to `.env` and change the `OKTA_*` values to your application
1. Initialize the PostgreSQL database by running `npm run initdb`
1. Run `npm run dev` to start Node.js

The associated blog post goes into more detail on how to set up PostgreSQL with Docker and how to configure your Okta account.
