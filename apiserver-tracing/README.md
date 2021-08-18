# Summary

Deploy k8s cluster enabled [kube-apiserver trace feature gate](https://kubernetes.io/docs/concepts/cluster-administration/system-traces/) by kind.
Please see [descriptions(keyword: APIServerTracing)](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.22.md#api-change) at CHANGELOG-1.22.md and [PR #94942](https://github.com/kubernetes/kubernetes/pull/94942) on kubernetes repository.

![Screenshot01](./img/01.png)

# Prerequisite

- Commands needed:
  - `kind`
  - `docker-compose`

# Usage

## Run
```
IP=<IP addres of host machine> make run
```

## Stop
```
make stop
```

# System Components Layout

TBD


