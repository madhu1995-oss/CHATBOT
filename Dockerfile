FROM ubuntu:18.04
ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www
RUN apt-get update && apt-get install \
  -y --no-install-recommends python3 python3-dev

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate && pip3 install rasa && pip3 install spacy
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en --force;

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
