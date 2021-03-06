# 프로젝트 build

https://pipe0502.tistory.com/entry/maven-wrapper-install

https://blog.leocat.kr/notes/2020/01/23/gradle-create-executable-jar-with-spring-boot

https://blog.leocat.kr/notes/2017/10/12/spring-boot-packaging-executable-jar-war

https://docs.spring.io/spring-boot/docs/2.3.0.RC1/gradle-plugin/reference/html/

https://gc.hosting.kr/blog-serverless-jib2/

https://github.com/dkorotych/gradle-maven-exec-plugin

https://medium.com/@gaemi/spring-boot-%EA%B3%BC-docker-with-jib-657d32a6b1f0

# maven error

maven setting에서 always update snapshots 체크


# mysql

https://kubernetes.io/ko/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/

# ingress

https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac


# .travis

https://mobicon.tistory.com/323

https://bmuschko.com/blog/dockerized-spring-boot-app/


# 무중단 업데이트

https://kubernetes.io/blog/2018/04/30/zero-downtime-deployment-kubernetes-jenkins/

https://www.haproxy.com/blog/rolling-updates-and-blue-green-deployments-with-kubernetes-and-haproxy/

https://tech.kakao.com/2018/12/24/kubernetes-deploy/



# sigterm

https://heowc.dev/2018/12/27/spring-boot-graceful-shutdown/

https://spring.io/blog/2020/05/15/spring-boot-2-3-0-available-now

https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-terminating-with-grace

https://docs.spring.io/spring-boot/docs/2.3.0.RC1/reference/htmlsingle/#boot-features-graceful-shutdown

https://github.com/spring-projects/spring-framework/blob/master/spring-context/src/main/java/org/springframework/context/support/AbstractApplicationContext.java#L941

```shell script
func connectionCleanupHook(cp *redis.Pool) {
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	signal.Notify(c, syscall.SIGTERM)
	signal.Notify(c, syscall.SIGKILL)
	go func() {
		<-c
		cp.Close()
		os.Exit(0)
	}()
}
```

# ci - travis gradle

https://spring.io/guides/gs/spring-boot-docker/

https://github.com/spring-guides/gs-spring-boot-docker/blob/master/initial/build.gradle

https://kimpaper.github.io/2016/07/14/gradle/

https://docs.travis-ci.com/user/languages/java/

https://www.reimaginer.me/entry/Travis%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-Spring-boot-Docker-%EC%9E%90%EB%8F%99%ED%99%94-CICD

http://blog.naver.com/PostView.nhn?blogId=indy9052&logNo=221080561915&parentCategoryNo=&categoryNo=8&viewDate=&isShowPopularPosts=false&from=postView

https://tomgregory.com/automating-docker-builds-with-gradle/

https://travis-ci.community/t/install-of-oracle-jdk-8-failing/3038/8


# health

https://supawer0728.github.io/2018/05/12/spring-actuator/

https://www.codeprimers.com/health-check-api-in-spring-boot-application/

https://spring.io/blog/2020/03/25/liveness-and-readiness-probes-with-spring-boot


# container user

https://github.com/GoogleContainerTools/distroless

https://github.com/tklx/base

https://pete-woods.com/2019/02/production-grade-spring-boot-docker-images/

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user


# log

https://goddaehee.tistory.com/206

https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#howto-logging

https://perfectacle.github.io/2018/07/22/spring-boot-2-log/


# app yaml 설계

https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes
