#!/bin/sh

set -e
# SP, PASSWORD , CLUSTER_NAME, CLUSTER_RESOURCE_GROUP
az login \
--service-principal \
--username $SP \
--password $PASSWORD \
--tenant $TENANT  > /dev/null

az $*