#!/bin/bash

set -ex
pushd attendee-service-source
	echo "Fetching Dependencies"
	./mvnw clean compile > /dev/null
	echo "Running Tests"
	./mvnw test
popd
echo "done....."
exit 0
