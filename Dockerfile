FROM python:3.6

LABEL maintainer="zalex2015@hotmail.com"
LABEL description="nginx-gunicorn-flask with python3"

COPY ./ /flask_app
WORKDIR /flask_app

# Debian使用国内源加速
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y python3-dev vim \
    && apt-get install -y nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN service nginx start

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir supervisor==4.2.0 \
    && pip install --no-cache-dir gunicorn==20.0.4 \
    && pip install --no-cache-dir greenlet==0.4.16 \
    && pip install --no-cache-dir eventlet==0.25.2 \
    && pip install --no-cache-dir gevent==20.6.2

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]