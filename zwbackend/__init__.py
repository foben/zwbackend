import os
import logging
from flask import Flask, request, session, g, redirect, url_for, abort, \
        render_template, flash, jsonify, make_response

app = Flask(__name__)
app.config.from_object(__name__)

from zwbackend import purchase, item
from ocr_reader import ReweReceiptReader

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

@app.route('/purchase/<int:purchase_id>')
def get_items_for_purchase_view(purchase_id):
    items = item.get_items_for_purchase_view(purchase_id)
    return jsonify(items)

@app.route('/purchase/<int:purchase_id>/items')
def get_items_by_purchase_id(purchase_id):
    idict = item.get_items_of_purchase(purchase_id)
    return jsonify(idict)

@app.route('/purchases')
def get_all_purchases():
    pdict = purchase.get_all_purchases()
    return jsonify(pdict)

@app.route('/purchases/month')
def get_purchases_by_month():
    pdict = purchase.get_purchases_by_month()
    return jsonify(pdict)

@app.route('/ocr')
def do_ocr():
    #Uploaded file:
    #rreader = ReweReceiptReader("uploads/upload.png")
    #Dummy rewe file:
    rreader = ReweReceiptReader("uploads/rewe.png")
    store = rreader.getStoreName()
    items = rreader.getReceiptItems()
    timestamp = rreader.getPurchaseDate()
    app.logger.debug("Timestamp: {}".format(timestamp))
    app.logger.debug("Store: {}".format(store))
    app.logger.debug("items: {}".format(items))
    purchase.create_purchase_from_zettel(timestamp, store, items) 
    return "success"

@app.route('/test')
def foo():
    return purchase.create_purchase_from_zettel(12377444, "ALDI",["adsf"])

@app.route('/shoppinglist', methods=['GET', 'POST'])
def upload_image():
    im = request.form['image']
    fh = open("uploads/upload.png", "wb")
    fh.write(im.decode('base64'))
    fh.close()
    return do_ocr(), 200
