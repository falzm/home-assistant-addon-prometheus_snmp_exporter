#!/usr/bin/env bashio
# ==============================================================================
# Home Assistant Community Add-on: Prometheus SNMP Exporter
# Configures Prometheus SNMP Exporter
# ==============================================================================

config_dir=/config
config_dir=$config_dir/prometheus_snmp_exporter
mkdir -p $config_dir
chmod 750 $config_dir
chown root:prometheus $config_dir
