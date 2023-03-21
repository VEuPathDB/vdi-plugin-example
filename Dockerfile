FROM veupathdb/vdi-plugin-handler-server:latest

RUN apk add --no-cache bash; \
  mkdir "/opt/veupathdb"

COPY bin/ /opt/veupathdb/

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall