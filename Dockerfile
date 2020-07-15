FROM python:3.6-alpine

LABEL maintainer="zalex2015@hotmail.com"
LABEL description="nginx-gunicorn-flask with python3"

ENV PYTHONIOENCODING=utf-8

COPY ./ /flask_app
WORKDIR /flask_app

# Alpine Linux 使用国内源镜像加速
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/latest-stable/community" >> /etc/apk/repositorie \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositorie \
    && echo "http://mirrors.ustc.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories \
    && echo "http://mirrors.ustc.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositorie

# 更新索引以生效
RUN apk update

RUN apk --update add --no-cache gcc \
    && apk --update add --no-cache g++ \
    && apk --update add --no-cache libffi-dev \
    && apk --update add --no-cache openssl-dev \
    && apk add --no-cache linux-headers


RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple supervisor==4.2.0 \
    && pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple gunicorn==20.0.4 \
    && pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple greenlet==0.4.16 \
    && pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple eventlet==0.25.2 \
    && pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple gevent==20.6.2

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]