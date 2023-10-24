# 처음 빌드했던거
FROM openjdk:17
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]


#FROM gradle:7.4-jdk17-alpine as builder
#
#WORKDIR /app
#COPY ./ ./
#RUN gradle clean build --no-daemon
## 빌더 이미지에서 애플리케이션 빌드
##COPY ./build/libs/*.jar /app.jar
#
## APP
#FROM openjdk:17
#WORKDIR /app
## 빌더 이미지에서 jar 파일만 복사
#COPY ${JAR_FILE} app.jar
#
#EXPOSE 8080
## root 대신 nobody 권한으로 실행
#USER nobody
#ENTRYPOINT ["java","-jar","/app.jar"]