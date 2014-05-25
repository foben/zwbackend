from zwbackend import db, helper
from zwbackend import app
from zwbackend import category
from flask import abort
import datetime

def get_all_items():
    database = db.get_db()
    cur = database.execute("""SELECT * FROM item;""")
    rows = cur.fetchall()
    items = {}
    idict = {'itemlist': [ dict(row) for row in rows ]}
    return idict

def get_items_of_purchase(purchase_id):
    database = db.get_db()
    cur = database.execute("""SELECT * FROM item
                              WHERE purchaseid = %d;""" % purchase_id)
    rows = cur.fetchall()
    items = {}
    idict = {'itemlist': [ dict(row) for row in rows ]}
    return idict

def create_item(name, price, quantity, purchaseid):
    database = db.get_db()
    categoryid = category.get_categoryid_for_itemname(name)
    #app.logger.debug("Got Category {} for item {}".format(categoryid, name))
    cur = database.execute("""INSERT INTO item
                            (name, price, quantity, purchaseid, categoryid)
                            values
                            (?, ?, ?, ?, ?);""",
                            [name, price, quantity, purchaseid, categoryid])
    itemid = cur.lastrowid
    database.commit()
    return itemid

def get_items_for_purchase_view(purchase_id):
    database = db.get_db()
    cur = database.execute("""SELECT s.name AS store, p.timestamp,
                                i.name, i.quantity, i.price, c.name AS categoryName
                              FROM purchase p, store s, item i, category c
                              WHERE p.id = %d AND p.storeid = s.id 
                                AND i.purchaseid = p.id AND i.categoryid = c.id;""" % purchase_id)

#    cur = database.execute("""SELECT s.name AS store, p.timestamp, SUM(i.price) AS priceSum, 
#                                i.name, i.quantity, i.price, c.name AS categoryName
#                              FROM purchase p, store s, item i, category c
#                              WHERE p.id = %d AND p.storeid = s.id 
#                                AND i.purchaseid = p.id AND i.categoryid = c.id;""" % purchase_id)
    rows = cur.fetchall()
    items = [dict(row) for row in rows]

    if len(items) < 1:
        abort(500)

    store = items[0]['store']
    date_time = datetime.datetime.fromtimestamp(items[0]['timestamp']).strftime('%d.%m.%Y %H:%M')
    psum = helper.to_string_price(sum([i['price'] for i in items]))

    for item in items:
        item['price'] = helper.to_string_price(item['price'])

    return {'store': store, 'datetime': date_time, 'sum': psum, 'items': items}

def update_category_for_item(itemid, categoryid):
    app.logger.debug("itemid: {},  categoryid: {}".format(itemid, categoryid))
    database = db.get_db()
    cur = database.execute("""UPDATE item SET categoryid=? WHERE id=?""",
                            [categoryid, itemid])
    database.commit()
