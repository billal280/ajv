ARG NODE_VERSION="22"
FROM node:${NODE_VERSION}-alpine

ARG IMAGE_VERSION="1.0"
ARG IMAGE_NAME="ajv-image"
ARG IMAGE_TITLE="AJV Validator Docker Image"
ARG IMAGE_SOURCE="https://github.com/billal280/ajv"
ARG IMAGE_DESCRIPTION="Docker image based on AJV"
ARG IMAGE_AUTHORS="Billal <billal.saidi136@gmail.com>"

ARG CONTAINER_USER='ajvuser'
ARG CONTAINER_GROUP='ajvgroup'

RUN apk -U upgrade && apk add --no-cache bash

RUN npm install -g npm@7.24.0

RUN npm install -g ajv

RUN echo "Global npm packages installed in: $(npm prefix -g)"

RUN mkdir -p /ajv && chmod o+w /ajv

RUN addgroup -S "${CONTAINER_GROUP}" && adduser -S "${CONTAINER_USER}" -G "${CONTAINER_GROUP}"

COPY check-ajv.sh /usr/local/bin/check-ajv.sh
RUN chmod +x /usr/local/bin/check-ajv.sh

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/check-ajv.sh"]
CMD ["/bin/bash"]
