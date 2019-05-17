# TaskForce.sh connector (unofficial) {quay.io/nomadreservations/taskforce-connector-docker}

> _Taskforce.sh connector image for, lite-weight from apline for container installs_


[![GitHub tag](https://img.shields.io/github/tag/nomadreservations/taskforce-connector-docker.svg)](https://github.com/nomadreservations/taskforce-connector-docker) [![Docker Stars](https://img.shields.io/docker/stars/nomadreservations/taskforce-connector-docker.svg)](https://quay.io/nomadreservations/taskforce-connector-docker) [![Docker Pulls](https://img.shields.io/docker/pulls/nomadreservations/taskforce-connector-docker.svg)](https://quay.io/nomadreservations/taskforce-connector-docker) [![](https://images.microbadger.com/badges/image/nomadreservations/taskforce-connector-docker:latest.svg)](https://microbadger.com/images/nomadreservations/taskforce-connector-docker:latest "Get your own image badge on microbadger.com")

This image contains the taskforce.sh connector command in a node apline container.

## Usage Example

{_An example of running the container. Most Outrigger-based projects use docker-compose, so that kind of example is preferred but a docker run is also very helpful._}

```
docker run -ti taskforce-connector taskforce -n "localhost" -t <api-key> -h <redis-host> -p <redis-port> --passwd <redis-password>
```

For all command line options see [the taskforce connector repository](https://github.com/taskforcesh/taskforce-connector)

Kubernetes deployment example:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: taskforce-connector
  name: taskforce-connector
spec:
  selector:
    matchLabels:
      app: taskforce-connector
  template:
    metadata:
      labels:
        app: taskforce-connector
    spec:
      containers:
      - name: taskforce-connector
        env:
          - name: API_KEY
            valueFrom:
              secretKeyRef:
                name: taskforce-connector
                key: api-key
          - name: NAME
            valueFrom:
              secretKeyRef:
                name: taskforce-connector
                key: name
          - name: HOST
            valueFrom:
              secretKeyRef:
                name: taskforce-connector
                key: host
          - name: PORT
            valueFrom:
              secretKeyRef:
                name: taskforce-connector
                key: port
          - name: REDIS_PASS
            valueFrom:
              secretKeyRef:
                name: taskforce-connector
                key: redis-password
        image: quay.io/nomadreservations/taskforce-connector-docker:latest
        command: ['taskforce']
        args: ["-t", "$(API_KEY)", "-n", "$(NAME)", "-h", "$(HOST)", "-p", "$(PORT)", "--passwd", "$(REDIS_PASS)"]
        imagePullPolicy: Always
```

To use this kubernetes example make sure you first create an appropriate secret for taskforce-connector.

## Maintainers

[![Nomad Reservations Logo](https://nomadreservations.co/wp-content/uploads/2019/03/logo_nomad-dark-full.png)](https://nomadreservations.co)
