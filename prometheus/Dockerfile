# Base image
FROM prom/prometheus:latest

# Set working directory
WORKDIR /etc/prometheus

# Copy configuration files and entrypoint script
COPY prometheus.yml targets entrypoint.sh ./

EXPOSE 9090

ENTRYPOINT ["./entrypoint.sh"]