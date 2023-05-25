FROM veupathdb/vdi-plugin-base:latest

COPY bin/ /opt/veupathdb/bin
COPY lib/ /opt/veupathdb/lib

RUN chmod +x /opt/veupathdb/bin/*
