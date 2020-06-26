FROM tklx/base:0.1.1 AS base
RUN groupadd -r app && useradd --uid 1000 --no-log-init -r -g app app

FROM gcr.io/distroless/java:8
COPY --from=base /etc/passwd /etc/shadow /etc/
USER app
WORKDIR /app
RUN mkdir logs
COPY spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war
CMD ["spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war"]
