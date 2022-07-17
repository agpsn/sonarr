FROM ghcr.io/agpsn/base:latest

ARG SBRANCH="main"
ARG SVERSION

RUN set -xe && \
	echo "***** update system packages *****" apk upgrade --no-cache && \
	echo "***** install build packages *****" && apk add --no-cache --virtual=build-dependencies jq && \
	echo "***** install runtime packages *****" && apk add --no-cache xmlstarlet curl && apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main tinyxml2 && apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community libmediainfo && apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing mono && \
	echo "***** install sonarr *****" && if [ -z ${SVERSION+x} ]; then SVERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r ".[] | select(.branch==\"$SBRANCH\") | .version"); fi && mkdir -p "${APP_DIR}"/bin && curl -o /tmp/sonarr.tar.gz -L "https://download.sonarr.tv/v3/${SBRANCH}/${SVERSION}/Sonarr.${SBRANCH}.${SVERSION}.linux.tar.gz" && tar xzf /tmp/sonarr.tar.gz -C "${APP_DIR}"/bin --strip-components=1 && printf "UpdateMethod=docker\nBranch=${SBRANCH}\nPackageVersion=${SVERSION}\nPackageAuthor=[agpsn](https://github.com/agpsn/sonarr)\n" >"${APP_DIR}"/package_info && \
	echo "***** cleanup sonarr *****" && find "${APP_DIR}"/bin -name '*.mdb' -delete && rm -rf "${APP_DIR}"/bin/Sonarr.Update && \
	echo "***** cleanup *****" && apk del --purge build-dependencies && rm -rf /tmp/* && cert-sync /etc/ssl/certs/ca-certificates.crt && \
	echo "***** setting version *****" && echo $SVERSION > /app/app_version

# add local files
COPY sonarr/root/ /

# healthcheck
HEALTHCHECK  --interval=30s --timeout=30s --start-period=10s --retries=5 CMD curl --fail http://localhost:8989 || exit 1


# ports and volumes
EXPOSE 8989
VOLUME "${CONFIG_DIR}"
