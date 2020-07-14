"""
gunicorn WSGI server configuration.

https://docs.gunicorn.org/en/latest/index.html
"""
import multiprocessing

loglevel = "debug"
bind = "0.0.0.0:5000"
workers = multiprocessing.cpu_count() * 2 + 1
worker_class = "gevent"
max_requests = 1000
pidfile = "gunicorn.pid"
accesslog = "gunicorn.access.log"
errorlog = "gunicorn.error.log"
