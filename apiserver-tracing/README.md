# Prerequisite

- Commands needed:
  - `kind`
  - `docker-compose`

## Usage
```
IP=<IP addres of host machine> make run
```

## System Components
hogehoge

---

## Create
```
kind create cluster --config ./kind-config.yaml
```

## Check Feature Gates enabled
```
docker ps
docker exec -it <ID of kind container> bash
crictl ps
crictl inspect <ID of kube-apiserver> | grep "feature-gates"
```

# Delete
```
kind delete cluster --config ./kind-config.yaml
```
