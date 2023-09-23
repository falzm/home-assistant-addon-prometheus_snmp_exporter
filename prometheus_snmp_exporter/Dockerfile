ARG BUILD_FROM
FROM $BUILD_FROM

ARG \
  BUILD_ARCH="amd64" \
  SNMP_EXPORTER_VERSION="0.24.1"

COPY rootfs /

RUN \
    apk add --no-cache --update tar \
    && ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && curl -J -L -o /tmp/snmp_exporter.tar.gz \
       "https://github.com/prometheus/snmp_exporter/releases/download/v${SNMP_EXPORTER_VERSION}/snmp_exporter-${SNMP_EXPORTER_VERSION}.linux-${ARCH}.tar.gz" \
    && cd /tmp \
    && tar -xzvf snmp_exporter.tar.gz --strip-components=1 \
    && mv snmp_exporter /usr/local/bin/ \
    && adduser -s /bin/false -D -H prometheus \
    && chown -R prometheus:prometheus /usr/local/bin/snmp_exporter \
    && rm -rf /tmp/snmp_exporter* LICENSE NOTICE
