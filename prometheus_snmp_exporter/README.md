# prometheus_snmp_exporter

Prometheus [SNMP Exporter](https://github.com/prometheus/snmp_exporter) for scraping metrics from SNMP-compatible devices.

## Installation

1. Add my [repository](https://github.com/falzm/home-assistant-addon-prometheus_snmp_exporter).
1. Search for the "Prometheus SNMP Exporter" add-on in the Supervisor add-on store and install it.
1. Optional - Check the `Configuration` tab of the add-on to make any changes you'd like.
1. Start the add-on.
1. Check the `Logs` tab of the add-on to see if everything went well.
1. To verify the metrics are available, visit `http://your_home_assistant_ip_address:9116/metrics` in your browser, or use curl: `curl -X GET http://your_home_assistant_ip_address:9116/metrics`.

## Configuration

By default, Prometheus SNMP Exporter listens on TCP port 9116.

### Command-line arguments

This option allows you to pass command-line arguments directly to Prometheus SNMP Exporter. This is particularly useful to adjust which [collectors](https://github.com/prometheus/snmp_exporter/#collectors) run. For example, to disable all collectors except the `cpu` collector, you can use this string: `--collector.disable-defaults --collector.cpu`.

## Usage with Prometheus server

Add the following to the `/etc/prometheus/prometheus.yml` config file on your Prometheus server:

```
scrape_configs:
  ...
  ...
  ...
  - job_name: 'homeassistant'
    static_configs:
    - targets: ['your_home_assistant_ip_address:9116']
```

The following Prometheus query should return data:

```
snmp_uname_info{job="homeassistant"}
```

## License

WIP
