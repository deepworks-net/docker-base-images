# Deepworks Alpine Images
This folder contains the Dockerfiles for various pinned versions of Alpine. This will be better documented at some point down the road, but for now here are the basics:

1. Add/update an existing Dockerfile. There is one for each pinned version of Alpine, in the form of `Dockerfile.alpine{version number}`. Ie Version 3.15 would be `Dockerfile.alpine315`.
2. Add/ensure the Dockerfile is referenced in the root `docker-compose.yml` file. This way it can be run and built by the docker compose engine.
3. Add/update the `CHANGELOG.alpine{version number}.md` file in the base of this repository.
