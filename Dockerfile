FROM ubuntu:18.04
RUN python3 -m venv --system-site-packages ./venv
RUN source ./venv/bin/activate
RUN sudo apt update
RUN sudo apt install python3-dev python3-pip

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN  apt update
RUN apt install python3-pip -y
RUN pip3 install rasa
RUN pip3 install spacy
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en --force;

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
