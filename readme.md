# A Collection of Containers as Commands for ACR Tasks
https://aka.ms/acr/tasks


### Get the credentials from KeyVault
Temporary solution for copying values into env vars from AzureCloud to Azure dogfood

```sh
export AKV_NAME=demo42
echo \
export SP=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-user \
            --query value -o tsv) $'\n'\
export PASSWORD=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-pwd \
            --query value -o tsv) $'\n'\
export TENANT=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-tenant \
            --query value -o tsv) $'\n'\
export GIT_TOKEN=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-git-token \
            --query value -o tsv) $'\n'\
export ACR_PULL_USR=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-pull-usr \
            --query value -o tsv) $'\n'\
export ACR_PULL_PWD=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-pull-pwd \
            --query value -o tsv) $'\n'\
export ACR_DF_PULL_USR=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-df-pull-usr \
            --query value -o tsv) $'\n'\
export ACR_DF_PULL_PWD=$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-df-pull-pwd \
            --query value -o tsv)

az acr task create \
    -n az-cli \
    -f az-cli\acr-task.yaml \
    -c https://github.com/AzureCR/cmd.git \
    --git-access-token $GIT_TOKEN
    -r commands

docker run -e TENANT=$TENANT -e SP=$SP -e PASSWORD=$PASSWORD az-cli
```
