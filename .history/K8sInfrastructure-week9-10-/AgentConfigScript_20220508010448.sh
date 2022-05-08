#!/bin/bash

# ######################################################################################

# HOST_URL=${okta_org_url}
# OKTA_CLIENT_SECRET=${okta_secret}
# OKTA_CLIENT_ID=${okta_client_id}
# OKTA_ORG_URL=${OKTA_ORG_URL}
# OKTA_KEY=${okta_key}

# curl --location --request PUT 'https://${OKTA_ORG_URL}//api/v1/apps/${OKTA_CLIENT_ID}' \
#     --header 'Accept: application/json' \
#     --header 'Content-Type: application/json' \
#     --header 'Authorization: SSWS ${OKTA_KEY}' \
#     --data-raw '{
#     "name": "oidc_client",
#     "label": "My Web App 1",
#     "credentials": {
#         "oauthClient": {
#             "autoKeyRotation": true,
#             "client_id": "${OKTA_CLIENT_ID}",
#             "token_endpoint_auth_method": "client_secret_basic"
#         }
#     },
#     "settings": {
#         "oauthClient": {
#             "redirect_uris": [
#                 "http://${HOST_URL}:8080/authorization-code/callback"
#             ],
#             "post_logout_redirect_uris": [
#                 "http://${HOST_URL}:8080/logout"
#             ],
#             "response_types": [
#                 "code"
#             ],
#             "application_type": "web",
#             "consent_method": "REQUIRED",
#             "issuer_mode": "DYNAMIC"
#         }
#     }
# }'

# ######################################################################################

sudo apt-get update # update server

sudo apt-get install -y docker.io #install docker

sudo chmod 666 /var/run/docker.sock

sudo snap install kubectl --classic # install kubectl to interact with aks

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash # install azure cli

az aks get-credentials --resource-group RG --name k8s-weight-tracker --overwrite-existing #connect to aks cluster
az aks update -n k8s-weight-tracker -g RG --attach-acr acrforapp

# kubectl exec myrepo-99b5d48cb-7xw24 printenv //shows the nv variables in pod

# az aks get-credentials --resource-group RG --name k8s-weight-tracker

#************** az aks update -n k8s-weight-tracker -g RG --attach-acr acrforapp # the command that made it posible to get the image from acr

#/********************************************************************************/
# A scripts to install azure devops pipeline agent on a linux machine
#
#  pool -> BuildPool
#  my user -> https://dev.azure.com/oderafiBigspender/
#  my project name -> BOOTCAMP-APP K8S
#  my project PAT token -> i2jhj7k4paij3jmxaccu2jcyovozisnn6ucb5hz2q755vrgksyna
#
#/********************************************************************************/
mkdir azagent
cd azagent
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.202.1/vsts-agent-linux-x64-2.202.1.tar.gz
tar -zxvf vstsagent.tar.gz
if [ -x "$(command -v systemctl)" ]; then
    ./config.sh --pool my-pool --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/lihaybs3/ --work _work --projectname 'BOOTCAMP-APP K8S' --auth PAT --token tkna4y7bjlm2qeo6pooyvqwbqhjzj5ntm66cqzkvjwk6wcl4utsa --runasservice
    sudo ./svc.sh install
    sudo ./svc.sh start
else
    ./config.sh --pool my-pool --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/lihaybs3/ --work _work --projectname 'BOOTCAMP-APP K8S' --auth PAT --token tkna4y7bjlm2qeo6pooyvqwbqhjzj5ntm66cqzkvjwk6wcl4utsa
    ./run.sh
fi
