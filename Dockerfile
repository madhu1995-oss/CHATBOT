FROM ubuntu:18.04
RUN apt-get update && apt-get install \
  -y --no-install-recommends python3 python3-virtualenv

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate

FROM rasa/rasa:latest-full

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN spacy download en_core_web_md
RUN  spacy link en_core_web_md en 

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
