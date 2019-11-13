FROM rasa/rasa

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN pip install rasa==1.3.0a1 --user
RUN pip install spacy --user
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
