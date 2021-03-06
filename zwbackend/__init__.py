import os
import logging
import calendar, time
import json
from flask import Flask, request, session, g, redirect, url_for, abort, \
        render_template, flash, jsonify, make_response

app = Flask(__name__)
app.config.from_object(__name__)

from zwbackend import purchase, item, category, helper, receipt

app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'zw.db'),
    DEBUG=True,
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))

@app.route('/')
def index():
    return render_template('index.html')

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

@app.route('/purchase/<int:purchase_id>/category')
def get_categories_of_purchase(purchase_id):
    result = category.get_categories_of_purchase(purchase_id)
    return jsonify(result)

@app.route('/category/year/<int:year>/month/<int:month>')
def get_categories_by_month(year, month):
    result = category.get_categories_by_month(year, month)
    return jsonify(result)

def extract_and_save_receipt(filename):
    r = receipt.extract_from_image(filename)
    purchase.save_purchase_from_zettel(r) 
    return r

@app.route('/shoppinglist', methods=['GET', 'POST'])
def upload_image():
    fname = 'uploads/upload_' + str(calendar.timegm(time.gmtime())) + '.png'
    im = request.form['image']
    fh = open(fname, "wb")
    fh.write(im.decode('base64'))
    fh.close()
    return extract_and_save_receipt(fname).to_json(), 200

@app.route('/upload', methods=['GET', 'POST'])
def multipart_form_upload_image():
    fs = request.files['shoppinglist']
    fname = helper.get_upload_file_name(fs.filename)
    fs.save(fname)
    return extract_and_save_receipt(fname).to_json(), 200

@app.route('/categories')
def get_categories():
    categories = category.get_categories()
    return jsonify({'categories': categories})

@app.route('/mappings', methods=['GET', 'POST'])
def mappings():
    if request.method == 'GET':
        mappings = category.get_mappings()
        return jsonify({'mappings':mappings})
    if request.method == 'POST':
        raise ValueError("adsf")

@app.route('/update_category', methods=['POST'])
def update_category():
    postdata = json.loads(request.data)
    itemid = postdata['itemid']
    categoryid = postdata['categoryid']
    itemstr = postdata['itemname']
    item.update_category_for_item(itemid, categoryid)

    return "success", 200

