FROM openjdk:11.0.7-slim
LABEL maintainer="juaniJ@gmail.com"
ARG JAR_FILE
ADD target/${JAR_FILE} dan-ms-cuentacorriente-0.0.1-SNAPSHOT.jar
RUN echo ${JAR_FILE}
EXPOSE 9000
ENTRYPOINT ["java","-jar","/dan-ms-cuentacorriente-0.0.1-SNAPSHOT.jar"]
