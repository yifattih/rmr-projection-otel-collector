FROM grafana/alloy:v1.7.2

WORKDIR /src

COPY ./src/config.alloy /etc/alloy/config.alloy

EXPOSE 4317
