import os
import logging
from logging.handlers import RotatingFileHandler
from flask import Flask, request, session, g, redirect, url_for, abort, \
        render_template, flash, jsonify, make_response

app = Flask(__name__)
app.config.from_object(__name__)

from zwbackend import db

app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'jokes.db'),
    DEBUG=True,
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))

@app.route('/')
def hello_world():
    db.init_db()
    return '<h1>ZW Backend live!</h1>'

@app.route('/shoppinglist', methods=['GET', 'POST'])
def upload_image():
    f = request.files['shoppinglist']
    app.logger.debug(f)
    f.save('uploads/' + f.filename)
    return "success", 200

if __name__ == '__main__':
    handler = RotatingFileHandler('applog.log', maxBytes=10000, backupCount=1)
    handler.setLevel(logging.DEBUG)
    app.logger.addHandler(handler)
    app.run('0.0.0.0')
