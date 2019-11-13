FROM rasa/rasa

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN pip3 install rasa==1.3.0a1
RUN pip3 install spacy
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
