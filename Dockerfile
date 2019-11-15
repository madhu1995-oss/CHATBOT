FROM ubuntu:18.04
ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www
RUN apt-get update && apt-get install \
  -y --no-install-recommends python3 python3-virtualenv

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate 
RUN  apt-get update
RUN  apt upgrade -y
RUN  apt install build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev
RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
RUN tar xf Python-3.7.0.tar.xz
RUN cd Python-3.7.0
RUN ./configure --enable-optimizations
RUN make -j 8
RUN make altinstall
RUN update-alternatives --config python3
RUN apt update
RUN apt install -y python3-pip
RUN pip3 install tensorflow==1.15.0
RUN pip3 install rasa 
RUN pip3 install spacy
RUN python3 -m spacy download en_core_web_md
RUN python3 -m spacy link en_core_web_md en --force;

ENTRYPOINT [ "rasa", "run", "-p", "8080"]
