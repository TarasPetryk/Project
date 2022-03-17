FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy openjdk-11-jdk && \
    apt-get -qy autoremove && \
    mkdir /home/clinic

#ADD target /home/clinic/

EXPOSE 8080

#CMD java -jar /home/clinic/*.jar
