#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "main" ]; then
    TAG="latest"
    TAG_VERSION=$TRAVIS_BUILD_NUMBER
else
    TAG="$TRAVIS_BRANCH"
    TAG_VERSION="$TRAVIS_BRANCH-$TRAVIS_BUILD_NUMBER"
fi
echo -n $TRAVIS_REPO_SLUG:${TAG_VERSION} > docker_image.txt
# docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker tag ${TRAVIS_REPO_SLUG}:${COMMIT} $TRAVIS_REPO_SLUG:${TAG}
docker tag ${TRAVIS_REPO_SLUG}:${COMMIT} $TRAVIS_REPO_SLUG:${TAG_VERSION}
docker push $TRAVIS_REPO_SLUG:$TAG
docker push $TRAVIS_REPO_SLUG:${TAG_VERSION}