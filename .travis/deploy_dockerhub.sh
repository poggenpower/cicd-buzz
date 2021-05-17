#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "main" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker tag $TRAVIS_REPO_SLUG:$TAG $TRAVIS_REPO_SLUG:$TRAVIS_BUILD_NUMBER
docker push $TRAVIS_REPO_SLUG:$TAG
docker push $TRAVIS_REPO_SLUG:$TRAVIS_BUILD_NUMBER