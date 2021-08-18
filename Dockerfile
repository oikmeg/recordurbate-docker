FROM python:alpine3.12

RUN apk add --no-cache \
  build-base \
  bash \
  ffmpeg \
  git \
  jpeg-dev \
  openssl-dev \
  python3-dev \
  zlib-dev

ENV LIBRARY_PATH=/lib:/usr/lib

RUN pip3 install --upgrade --no-cache-dir pip setuptools && \
  ln -s -f pip3 /usr/bin/pip && \
  ln -s -f /usr/bin/python3 /usr/bin/python

RUN pip install --no-cache-dir requests youtube-dl

WORKDIR /app/recordurbate

RUN git clone https://github.com/oliverjrose99/Recordurbate.git && \
  mv -v Recordurbate/recordurbate/* . && \
  rm -rfv Recordurbate && \
  chmod +x Recordurbate.py && \
  rm -rf configs && \
  echo 'alias recordurbate="python /app/recordurbate/Recordurbate.py"' >> ~/.bashrc

RUN apk del \
  build-base \
  git \
  jpeg-dev \
  python3-dev \
  zlib-dev

USER 99:100

CMD python Recordurbate.py restart && tail -f configs/rb.log
