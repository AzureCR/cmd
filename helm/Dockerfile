# az acr build -t functions/helm:latest .
FROM microsoft/azure-cli:latest
ENV VERSION v2.11.0-rc.2

MAINTAINER  Sajay Antony <sajaya@microsoft.com>

# Enable SSL
RUN apk --update add ca-certificates wget python curl tar

# Install Kubectl
RUN az aks install-cli 

# Install Helm
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz
ENV HELM_URL https://storage.googleapis.com/kubernetes-helm/${FILENAME}

RUN curl -o /tmp/$FILENAME ${HELM_URL} \
  && tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp

ADD ./deploy.sh /deploy.sh
ENTRYPOINT ["/deploy.sh"]
#ADD ./demo42-staging-eus.kubeConfig /demo42-staging-eus.kubeConfig
# Note: This file is excluded from github to avoid checking in credentials
# Note: This workflow will be fixed in a future build
# Note: run az aks list, then az aks get-credentials -n -g to get the right config file
# Note: copy that file to the root of this directory, and run docker build
#env KUBECONFIG=/demo42-staging-eus.kubeConfig
