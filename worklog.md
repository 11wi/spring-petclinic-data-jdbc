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
plugins {
   id 'application'
mainClassName='org.springframework.samples.petclinic.PetClinicApplication'
---

# add src/main/resources/logback-spring.xml
# add src/main/resources/logback/config.xml

rm -rf .gradle
./gradlew clean build

sudo mkdir -p /logs
sudo chmod 777 /logs

./gradlew run

# edit build.gradle
---
docker {
    name "${project.name}:${project.version}"
    files 'build/libs/spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.jar'
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
kubectl apply -f kubernetes-manifests

```
