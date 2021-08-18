# Name for k8s cluster
NAME ?= v1.22-cluster
# IP address for host computer, 
IP ?= 0.0.0.0

all: run

.PHONY: run
run: up-otel-collector generate
	kind create cluster --config ./kind-config.yaml --name $(NAME)

.PHONY: generate
generate:
	sed ./trace-configuration.yaml.template -e "s/<HOST_IP>/$(IP)/g" > ./trace-configuration.yaml

.PHONY: delete 
stop: down-otel-collector
	kind delete cluster  --name $(NAME)

.PHONY: up-otel-collector
up-otel-collector:
	make -C ./opentelemetry up

.PHONY: down-otel-collector
down-otel-collector:
	make -C ./opentelemetry down
