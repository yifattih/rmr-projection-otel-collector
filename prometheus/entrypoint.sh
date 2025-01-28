#!/bin/sh

# Start Prometheus with the dynamically generated configuration
exec prometheus --config.file=prometheus.yml