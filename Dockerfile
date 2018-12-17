FROM java:8-jdk-alpine
RUN mkdir my-app
WORKDIR my-app
COPY target/my-app-1.0-SNAPSHOT.jar my-app/
CMD java -jar my-app/my-app-1.0-SNAPSHOT.jar