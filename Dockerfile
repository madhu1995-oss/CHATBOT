FROM rasa/rasa

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN pip install spacy
RUN spacy download en_core_web_md
RUN spacy link en_core_web_md en

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
