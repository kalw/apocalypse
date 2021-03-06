FROM gliderlabs/alpine:latest
ENV TERM=xterm
ENV APOCALIPSE_VERSION=master

RUN apk --no-cache add python py-pip
RUN pip install --upgrade pip

EXPOSE 5555

RUN apk --no-cache add --virtual build-dependencies wget ca-certificates python-dev build-base git linux-headers
RUN pip install setuptools --upgrade
#RUN pip install git+https://github.com/dhoomakethu/python-coloredlogs.git@master 
RUN pip install git+https://github.com/kalw/apocalypse.git@${APOCALIPSE_VERSION} 
RUN pip install -U psutil
RUN apk del build-dependencies 
RUN rm -f /tmp/*

RUN rm -f /tmp/*.tar.gz
