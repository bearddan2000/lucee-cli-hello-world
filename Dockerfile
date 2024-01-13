FROM lucee/lucee:5.4.4.38-light-tomcat9.0-jdk11-temurin-jammy

ENV GIT_REPO=https://github.com/rzuckerm/lucee-docker-image.git

WORKDIR /workspace

RUN apt update

RUN apt install -y git python3

RUN git clone $GIT_REPO docker-image

RUN mv docker-image/LUCEE_* /tmp/

RUN mv docker-image/run_lucee /usr/local/bin/

WORKDIR /code

COPY bin .

CMD "./run.sh"