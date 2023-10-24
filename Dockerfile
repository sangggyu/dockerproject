## 처음 빌드했던거
#FROM openjdk:17
#ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

# 첫 번째 스테이지: 애플리케이션 빌드
FROM openjdk:17 AS build
COPY . /home/gradle/src
WORKDIR /home/gradle/src
ARG JAR_FILE=build/libs/*.jar

# 두 번째 스테이지: 테스트
FROM build AS test
RUN ./gradlew test

# 세 번째 스테이지: 최종 이미지 생성
FROM openjdk:17
COPY --from=build /home/gradle/src/build/libs/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]