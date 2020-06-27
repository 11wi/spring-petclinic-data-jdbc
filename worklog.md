# codes


## ci

```shell script
brew cask install homebrew/cask-versions/adoptopenjdk8
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv versions
jenv global 1.8
jenv versions

cd /Users/admin/IdeaProjects/spring-petclinic-data-jdbc

gradle init --type pom

# tomcat dead, edit build.gradle
---
    id 'war'

apply plugin: "io.spring.dependency-management"

    providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
---
# add src/main/resources/logback/console.xml
# add src/main/resources/logback/file.xml
# fix src/main/resources/application.properties
---
spring.datasource.url=jdbc:mysql://mysql.default.svc.cluster.local
logging.config=classpath:logback-spring.xml
server.shutdown.grace-period=30s
---

./gradlew clean mavenbuild

mkdir -p ./logs

./gradlew bootRun

# docker operation, edit build.gradle
---
docker {
    name "${project.name}:${project.version}"
    files 'build/libs/spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war'
    tag 'DockerHub', "angju8/gradle-docker-example:${project.version}"
}
---

# Dockerfile
# useradd --uid 1000

# jar file not executable.
java -jar build/libs/*
# use spring gradle plugin

./gradlew docker --info

./gradlew dockerTagDockerHub

./gradlew dockerPushDockerHub

# end of local test

# make .travis.yml with gradlew commands tested above
# and push repo.
# travis build success
```

```shell script
# css file not exits...
# upgrade container, edit build.gradle
---
    id 'com.google.cloud.tools.jib' version '2.4.0'
jib {
    to.image = 'angju8/petclinic'
    container {
        jvmFlags = ['-Xms512m', '-Xdebug', '-Xmy:flag=jib-rules']
        mainClass = 'org.springframework.samples.petclinic.PetClinicApplication'
        ports = ['8080']
        user='1000:1000'
        volumes=['/tmp']
    }
}
---

```

## k8s deploy

```shell script
# https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac
mkdir -p /tmp/logs
# hostpath provision
kubectl apply -f kubernetes-manifests/storageclass.yaml
kubectl apply -f kubernetes-manifests/ingress-nginx.yaml
# statefuleset, passwd는 secret으로
kubectl apply -f kubernetes-manifests/mysql.yaml
# volumes hostpath로, livenessProbe, sigterm 받는 api가 이미 있음. SpringContextShutdownHook 
kubectl apply -f kubernetes-manifests/petclinic.yaml
```
