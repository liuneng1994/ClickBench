# amazonlinux:2023.0.20230322.0 architecture: amd64, same as AMI ID: ami-0ea68e9c2835c8288
FROM ubuntu:22.04

# install package for building libch.so
RUN apt-get update -y \
&&  apt-get install wget -y \
&&  apt-get install openjdk-8-jdk-headless -y \
&&  apt-get install supervisor -y


# install spark-3.2.4
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz\
    && tar -xzf spark-3.2.4-bin-hadoop3.2.tgz \
    && mv spark-3.2.4-bin-hadoop3.2 /usr/local/spark \
    && rm spark-3.2.4-bin-hadoop3.2.tgz

ENV SPARK_HOME="/usr/local/spark"

ENTRYPOINT ["tail", "-f", "/dev/null"]