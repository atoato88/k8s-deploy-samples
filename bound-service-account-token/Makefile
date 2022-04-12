# Name for k8s cluster
NAME ?= v1.23-cluster

all: run

.PHONY: run
run:
	kind create cluster --config ./kind-config.yaml --name $(NAME)

.PHONY: stop
stop:
	kind delete cluster  --name $(NAME)

