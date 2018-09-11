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

ADD ./helm/deploy.sh /deploy.sh
ENTRYPOINT ["/deploy.sh"]
