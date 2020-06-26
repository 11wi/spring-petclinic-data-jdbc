# spring-petclinic-data-jdbc on k8s

[![Build Status](https://travis-ci.org/11wi/spring-petclinic-data-jdbc.svg?branch=master)](https://travis-ci.org/11wi/spring-petclinic-data-jdbc)

## env
* mac os 10.15.4
* docker 19.03
* docker desktop k8s 1.16.6


## commands

```shell script
# https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f kubernetes-manifests/storageclass.yaml
kubectl apply -f kubernetes-manifests/mysql.yaml



```
