set -ex

pwd
env

echo "current apps and routes:"
cf apps

cf api $CF_API --skip-ssl-validation

cf login -u $CF_USER -p $CF_PWD -o "$CF_ORG" -s "$CF_SPACE"
echo "Un-mapping old version of app:"
cf unmap-route $CF_APP_SUFFIX $CF_DOMAIN -n $CF_ROUTE
echo "Un-mapping new version from temp domain:"
cf unmap-route $CF_APP_SUFFIX_TEMP $CF_DOMAIN -n $CF_ROUTE-temp
cf routes
echo "deleting old app:"
cf delete $CF_APP_SUFFIX
echo "renaming app:"
cf rename $CF_APP_SUFFIX_TEMP $CF_APP_SUFFIX
echo "DONE.."
cf apps
