FROM veupathdb/vdi-plugin-handler-server:2.0.0

COPY bin/ /opt/veupathdb/bin
COPY lib/ /opt/veupathdb/lib

RUN chmod +x /opt/veupathdb/bin/*
