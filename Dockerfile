FROM tklx/base:0.1.1 AS base
RUN groupadd -r app && useradd --uid 1000 --no-log-init -r -g app app
RUN mkdir -p /app/logs

FROM gcr.io/distroless/java:8
COPY --from=base /etc/passwd /etc/shadow /etc/
USER app
COPY spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war /app/spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war
WORKDIR /app/logs
COPY --from=base
CMD ["spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war"]
