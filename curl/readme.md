# Helm Charts
```sh
docker build -t curl -f ./Dockerfile ./curl
```
```sh
az acr run \
  --file ./curl/acr-task.yaml \
  -r commands \
  .
```

```sh
az acr task create \
  -n cmd-curl \
  --file ./curl/acr-task.yaml \
  -c https://github.com/AzureCR/cmd.git \
  --git-access-token ${GIT_TOKEN} \
  -r commands
```