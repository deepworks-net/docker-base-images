#!/bin/sh
DOCKER_UTILS_TAG_EM=${DOCKER_UTILS_TAG_EM:-YES}
DOCKER_UTILS_PUBLISH=${DOCKER_UTILS_PUBLISH:-YES}
#DOCKER_UTILS_DEBUG=${DOCKER_UTILS_DEBUG:-YES}
IMAGE_NAME=${IMAGE_NAME:?err}
IMAGE_VERSION=${IMAGE_VERSION:?err}

# Load functions
. "utils/funcs.sh"

# Publish Images
echo "Publishing $IMAGE_NAME - $IMAGE_VERSION"
BTP_IMAGE --image-name "$IMAGE_NAME" \
            --image-version "$IMAGE_VERSION" \
            --publish "ONLY"

