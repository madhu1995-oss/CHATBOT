FROM rasa/rasa

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN sudo  pip install rasa==1.3.0a1 
RUN sudo pip install spacy 
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
