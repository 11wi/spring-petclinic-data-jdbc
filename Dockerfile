FROM openjdk:8-jre-slim-buster
RUN groupadd -r app && useradd --uid 1000 --no-log-init -r -g app app
USER app
WORKDIR /app
RUN mkdir -p /home/app/.wavefront_freemium
COPY spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war .
CMD ["java", "-jar", "spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.war"]
