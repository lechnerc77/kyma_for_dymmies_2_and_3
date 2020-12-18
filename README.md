# Kyma for Dymmies [2] and [3] - The unofficial Code Repo

This repository contains the code used in the blog blog posts [Kyma for Dymmies [2]: First Simple Microservice with Security](https://blogs.sap.com/2020/12/10/kyma-for-dymmies-2-first-simple-microservice-with-security/) and [Kyma for Dymmies [3]: calling secured service with REST client](https://blogs.sap.com/2020/12/14/kyma-for-dymmies-3-calling-secured-service-with-rest-client/)

## Prerequisites

There are two prerequisites in order to make use of all parts of the repo:

* [GNU Make](https://www.gnu.org/software/make/) on your system. For Windows you can either use [GNUWin32](http://gnuwin32.sourceforge.net/packages/make.htm) or install it via [Chocolatey](https://chocolatey.org/install) (`choco install make`) - needed for the `Makefile`
* [REST CLient extension in VSCode](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) - Needed for the `requests.http` file

## How to use

1. Clone the repo.
2. Put your DockerHub ID in the file [Makefile](./Makefile) to replace `<YOUR_DOCKER_ID>`.
3. Create and push your Docker image via `make push-image`.
4. Put your DockerHub ID in the file [deployment.yaml](./k8s/deployment.yaml) to replace `<YOUR_DOCKER_ID>`.
5. Create the relevant objects in Kyma:

   * The deployment objects via `kubectl -n <YOUR_NAMESPACE> apply -f ./k8s/deyployment.yaml`
   * The service object via `kubectl -n <YOUR_NAMESPACE> apply -f ./k8s/service.yaml`
   * The API rule object via `kubectl -n <YOUR_NAMESPACE> apply -f ./k8s/apirule.yaml`

6. After the deployment to Kyma, fetch the domain of your Kyma cluster and put it in the file [requests.http](./requests.http) to replace `<YOUR_KYMA_DOMAIN>`.
7. After the creatiion of the OAuth2 client, put the values for client id and client secret into the file [requests.http](./requests.http) to replace `<YOUR_CLIENT_ID>` and `<YOUR_CLIENT_SECRET>`
8. Execute the calls to the different Kyma endpoints.
