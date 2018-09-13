# Helm Charts
```sh
az acr run \
  --file ./helm/acr-task.yaml \
  -r commands \
  .
```

```sh
docker run --rm -it \
  -e SP="$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-user \
            --query value -o tsv)" \
  -e PASSWORD="$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-pwd \
            --query value -o tsv)" \
  -e TENANT="$(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name demo42-serviceaccount-tenant \
            --query value -o tsv)" \
  -e CLUSTER_RESOURCE_GROUP=demo42-staging-eus \
  -e CLUSTER_NAME=demo42-staging-eus \
  -v C:/Users/stevelas/Documents/github/demo42/deploy:/repo \
  -w /repo \
  helm upgrade demo42 ./helm/importantThings --reuse-values 
  --set imageCredentials.registry=demo42.azurecr-test.io \
  --set imageCredentials.username=${ACR_DF_PULL_USR} \
  --set imageCredentials.password=${ACR_DF_PULL_PWD}

docker run -it \
-v C:/Users/stevelas/Documents/github/demo42/deploy:/repo \
-w /repo \
 bash ls

docker build -t cmd.azurecr-test.io/helm:v2.11.0-rc.2 .
docker run --rm -it \
  -e SP=$SP \
  -e PASSWORD=$PASSWORD \
  -e TENANT=$TENANT \
  -e CLUSTER_RESOURCE_GROUP=demo42-staging-eus \
  -e CLUSTER_NAME=demo42-staging-eus \
  -v C:/Users/stevelas/Documents/github/demo42/web:/repo \
  -w /repo \
  cmd.azurecr-test.io/helm:v2.11.0-rc.2 \
    upgrade demo42 ./helm/importantThings --reuse-values \
    --set web.image=demo42.azurecr-test.io/demo42/web:yd19 \
    --set imageCredentials.registry=demo42.azurecr-test.io \
    --set imageCredentials.username=${ACR_DF_PULL_USR} \
    --set imageCredentials.password=${ACR_DF_PULL_PWD}



    env:
      - TENANT={{.Values.TENANT}}
      - SP={{.Values.SP}}
      - PASSWORD={{.Values.PASSWORD}}
      - CLUSTER_RESOURCE_GROUP={{.Values.CLUSTER_RESOURCE_GROUP}}
      - CLUSTER_NAME={{.Values.CLUSTER_NAME}}
  

```

** Dogfood **
```sh
az acr task create \
  -n cmd-helm \
  --file ./helm/acr-task.yaml \
  -c https://github.com/AzureCR/cmd.git \
  --git-access-token ${GIT_TOKEN} \
  -r commands
```
** Prod **
```sh
az acr task create \
  -n cmd-helm \
  --file ./helm/acr-task.yaml \
  -c https://github.com/AzureCR/cmd.git \
  --git-access-token $(az keyvault secret show \
            --vault-name ${AKV_NAME} \
            --name ${GIT_TOKEN_NAME} \
            --query value -o tsv) \
  -r commands
```