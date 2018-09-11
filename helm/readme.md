# Helm Charts

** Dogfood **
```sh
az acr task create \
  -n cmd-helm \
  --file ./helm/acr-task.yaml \
  -c https://github.com/AzureCR/cmd.git \
  --git-access-token ${GIT-TOKEN}
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
            --query value -o tsv)
```