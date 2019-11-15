FROM tensorflow/tensorflow:1.15.0-gpu-py3
ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN pip3 install rasa 
RUN pip3 install spacy
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en --force;

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
