# write 1. build, 2. app, 3. manifest code

* [ ] gradle로 build
* [ ] app log 파일 host mount - /logs
* [ ] readinessprobe, livenessprobe - period: 10, fail.thres: 3  
* [ ] 종료시 30초 이후 강제 sigkill
* [ ] 무중단배포, graceful-shutdown
* [ ] container 계정 uid: 1000
* [ ] db - statefulset, connect to cluster dns
* [x] nginx-ingress
* [ ] namespace: default
* [X] README.md
