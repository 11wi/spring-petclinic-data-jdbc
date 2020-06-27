# spring-petclinic-data-jdbc on k8s

[![Build Status](https://travis-ci.org/11wi/spring-petclinic-data-jdbc.svg?branch=master)](https://travis-ci.org/11wi/spring-petclinic-data-jdbc)

## env
* mac os 10.15.4
* docker 19.03
* docker desktop k8s 1.16.6


## install

```shell script
git clone https://github.com/11wi/spring-petclinic-data-jdbc 
cd spring-petclinic-data-jdbc 
```

spring boot image는 github push가 있으면 자동으로 빌드되어(travis.ci) `docker.io/angju8/petclinic`으로 push 된다. [travis](https://travis-ci.org/github/11wi/spring-petclinic-data-jdbc)
먼저 kubernetes 인프라 환경을 잡는다. 

```shell script
# hostpath provision
kubectl apply -f kubernetes-manifests/storageclass.yaml
# nginx
kubectl apply -f kubernetes-manifests/ingress-nginx.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s
```

mac catalina부터 `/` 경로에 파일 쓰기가 어려워 `/tmp/logs` 경로에 log를 적재한다.

```shell script
mkdir -p /tmp/logs
```

petclinic 앱을 배포한다.

```shell script
kubectl apply -f kubernetes-manifests/mysql.yaml
kubectl apply -f kubernetes-manifests/petclinic.yaml
```

브라우저 접속

[localhost](http://localhost:80)


## checklist

* [x] gradle로 build, containerize: `build.gradle`
* [x] app log 파일 host mount: mac catalina 보안상 /tmp/logs로 지정
* [x] readinessprobe, livenessprobe: period: 10, fail.thres: 3 `kubernetes-manifests/mysql.yaml` `kubernetes-manifests/petclinic.yaml` 
* [x] 종료시 30초 이후 강제 sigkill: terminationGracePeriodSeconds
* [x] 무중단배포, graceful-shutdown: `server.shutdown.grace-period=30s` rc1은 SpringContextShutdownHook 로그가 실행되면서 graceful 종료로 보임.
* [x] container uid=1000: `build.gradle` `jib {user}` 설정
* [x] stateful db, cluster dns: `application.properties`, `kubernetes-manifests/mysql.yaml`
* [x] nginx-ingress: `kubernetes-manifests/ingress-nginx.yaml`
* [x] namespace default
* [X] README.md


## uninstall 

```shell script
kubectl delete -f kubernetes-manifests/mysql.yaml
kubectl delete -f kubernetes-manifests/petclinic.yaml
kubectl delete pvc,pv -l app=mysql
rm -rf /tmp/logs
```
