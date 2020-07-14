FROM python:3.6

COPY ./ /flask_app
WORKDIR /flask_app

RUN apt-get update && apt-get install -y python3-dev vim
RUN apt-get clean
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir supervisor==4.2.0 \
    && pip install --no-cache-dir gunicorn==20.0.4 \
    && pip install --no-cache-dir greenlet==0.4.16 \
    && pip install --no-cache-dir eventlet==0.25.2 \
    && pip install --no-cache-dir gevent==20.6.2

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]