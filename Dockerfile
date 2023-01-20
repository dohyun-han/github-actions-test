FROM openjdk:17-alpine

WORKDIR /usr/src/app

ARG JAR_PATH=./build/libs

COPY ${JAR_PATH}/actions-0.0.1-SNAPSHOT.jar ${JAR_PATH}/actions-0.0.1-SNAPSHOT.jar

CMD ["java", "-Dspring.profiles.active=${SERVER_MODE}", "-Dspring.datasource.username=${MYSQL_USERNAME}", "-Dspring.datasource.password=${MYSQL_PASSWORD}", "-jar","./build/libs/actions-0.0.1-SNAPSHOT.jar"]