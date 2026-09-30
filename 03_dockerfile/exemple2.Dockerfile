FROM debian:13

COPY data.txt /

RUN apt update
RUN apt install redis-server -y

EXPOSE 6379/tcp

RUN useradd -m -s /bin/bash camille
RUN groupadd utilisateurs

USER camille:utilisateurs
WORKDIR /home/camille/