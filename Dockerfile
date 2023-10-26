FROM veupathdb/vdi-plugin-handler-server:branch-gus-apidb

COPY bin/ /opt/veupathdb/bin
COPY lib/ /opt/veupathdb/lib

RUN chmod +x /opt/veupathdb/bin/*
