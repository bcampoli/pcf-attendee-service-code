#!/bin/bash
set -ex

pwd
env



cf api $CF_API --skip-ssl-validation

cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"

cf apps

cf map-route $CF_APP_SUFFIX_TEMP $CF_DOMAIN -n $CF_APP_SUFFIX-$CF_ROUTE

echo "app now re-mapped to new routes:"
cf apps
