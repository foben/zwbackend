import os
import logging
from flask import Flask, request, session, g, redirect, url_for, abort, \
        render_template, flash, jsonify, make_response

app = Flask(__name__)
app.config.from_object(__name__)

from zwbackend import purchase, item

app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'zw.db'),
    DEBUG=True,
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))

@app.route('/')
def hello_world():
    return '<h1>ZW Backend live!</h1>'

@app.route('/items')
def get_all_items():
    idict = item.get_all_items()
    return jsonify(idict)

@app.route('/purchase/<int:purchase_id>/items')
def get_items_by_purchase_id(purchase_id):
    idict = item.get_items_of_purchase(purchase_id)
    return jsonify(idict)

@app.route('/purchases')
def get_all_purchases():
    pdict = purchase.get_all_purchases()
    return jsonify(pdict)

@app.route('/shoppinglist', methods=['GET', 'POST'])
def upload_image():
    f = request.files['shoppinglist']
    app.logger.debug(f)
    f.save('uploads/' + f.filename)
    return "success", 200
