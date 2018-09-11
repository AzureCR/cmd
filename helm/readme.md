# Helm Charts
```sh
az acr run \
  --file ./helm/acr-task.yaml \
  -r commands \
  .
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