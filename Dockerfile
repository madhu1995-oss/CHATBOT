FROM ubuntu:18.04
RUN apt-get update && apt-get install \
  -y --no-install-recommends python3 python3-virtualenv

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate
RUN python3 -v

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN  apt update
RUN apt install python3-pip -y
RUN pip3 install tensorflow==1.15.0
RUN pip3 install rasa
RUN pip3 install spacy
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en --force;

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
