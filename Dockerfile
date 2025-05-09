# Any base image may be used as long as java21 is installed and the plugin
# server is downloaded into it by runtime.
FROM foxcapades/ubuntu-corretto:24.10-jdk21

ENV LANG=en_US.UTF-8 \
  JVM_MEM_ARGS="-Xms16m -Xmx64m" \
  JVM_ARGS="" \
  TZ="America/New_York" \
  PATH=/opt/veupathdb/bin:$PATH

RUN apt-get update \
  && apt-get install -y locales \
  && sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen \
  && dpkg-reconfigure --frontend=noninteractive locales \
  && update-locale LANG=en_US.UTF-8 \
  && apt-get install -y tzdata curl wget \
  && cp /usr/share/zoneinfo/America/New_York /etc/localtime \
  && echo ${TZ} > /etc/timezone

COPY bin/ /opt/veupathdb/bin
COPY lib/ /opt/veupathdb/lib

RUN chmod +x /opt/veupathdb/bin/*

ARG PLUGIN_SERVER_VERSION=v8.2.0-beta.1
RUN set -o pipefail \
    && curl "https://github.com/VEuPathDB/vdi-plugin-handler-server/releases/download/${PLUGIN_SERVER_VERSION}/docker-download.sh" -Lf --no-progress-meter | bash

CMD /startup.sh