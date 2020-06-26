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

# edit build.gradle
---
    id 'war'

apply plugin: "io.spring.dependency-management"

    providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
---
# add src/main/resources/logback-spring.xml
# add src/main/resources/logback/config.xml

./gradlew clean build

mkdir -p ./logs

./gradlew bootRun

# edit build.gradle
---
docker {
    name "${project.name}:${project.version}"
    files 'build/libs/spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war'
    tag 'DockerHub', "angju8/gradle-docker-example:${project.version}"
}
---

./gradlew docker --info

./gradlew dockerTagDockerHub

./gradlew dockerPushDockerHub

# end of local test

# make .travis.yml with gradlew commands tested above
# and push repo


java -jar build/libs/*
 
# https://mkyong.com/gradle/gradle-create-a-jar-file-with-dependencies/
```

## k8s deploy

```shell script
# https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac
kubectl apply -f kubernetes-manifests/storageclass.yaml
kubectl apply -f kubernetes-manifests/ingress-nginx.yaml
kubectl apply -f kubernetes-manifests/mysql.yaml
kubectl apply -f kubernetes-manifests/petclinic.yaml
```
