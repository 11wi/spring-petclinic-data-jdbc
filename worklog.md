# 프로젝트 build

https://atoz-develop.tistory.com/entry/Spring-%EC%8A%A4%ED%94%84%EB%A7%81-%EC%98%88%EC%A0%9C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-PetClinic-%EB%B9%8C%EB%93%9C-%EB%B0%8F-%EC%8B%A4%ED%96%89%ED%95%98%EA%B8%B0
https://pipe0502.tistory.com/entry/maven-wrapper-install


mvnw package

# maven error

maven setting에서 always update snapshots 체크


# mysql

https://kubernetes.io/ko/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/

* statefulset 타입
* passwd는 secret으로



# .travis는 무엇?

https://mobicon.tistory.com/323


# 무중단 업데이트

https://kubernetes.io/blog/2018/04/30/zero-downtime-deployment-kubernetes-jenkins/
https://www.haproxy.com/blog/rolling-updates-and-blue-green-deployments-with-kubernetes-and-haproxy/
https://tech.kakao.com/2018/12/24/kubernetes-deploy/



# sigterm

terminationGracePeriodSeconds

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

# app yaml 설계

https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes

무중단배포 - RollingUpdate, maxSurge

프로세스 계정 - ??


# gracefulshutdown

https://heowc.dev/2018/12/27/spring-boot-graceful-shutdown/
