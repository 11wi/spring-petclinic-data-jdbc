FROM tklx/base:0.1.1 AS linux
RUN groupadd -r app && useradd --uid 1000 --no-log-init -r -g app app

FROM gcr.io/distroless/java:8
COPY --from=linux /etc/passwd /etc/shadow /etc/
USER app
WORKDIR /app
COPY spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war .
CMD ["spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war"]
