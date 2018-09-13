# Helm Charts
```sh
docker build -t wget -f ./Dockerfile ./wget
```
```sh
az acr run \
  --file ./wget/acr-task.yaml \
  -r commands \
  .
```

```sh
az acr task create \
  -n cmd-curl \
  --file ./wget/acr-task.yaml \
  -c https://github.com/AzureCR/cmd.git \
  --git-access-token ${GIT_TOKEN} \
  -r commands
```