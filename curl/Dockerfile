FROM ubuntu:trusty
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists
ENTRYPOINT ["curl"]

