from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(error):
    return render_template('500.html'), 500


@app.route('/')
def hello_world():
    return 'Hello Flask!'


if __name__ == '__main__':
    app.run()
