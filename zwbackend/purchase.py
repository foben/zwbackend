from zwbackend import db, helper
from zwbackend import app
from zwbackend import item
from zwbackend import receipt

import datetime

def get_all_purchases():
    database = db.get_db()
    cur = database.execute("""SELECT p.id, p.timestamp, s.name AS storeName, SUM(i.price) AS priceSum
                              FROM purchase p, store s, item i
                              WHERE p.storeid = s.id AND i.purchaseid = p.id
                              GROUP BY i.purchaseid
                              ORDER BY p.timestamp;""")
    rows = cur.fetchall()
    pdict = {'purchaselist': [ dict(row) for row in rows ]}
    return pdict

def get_purchases_by_month():
    database = db.get_db()
    cur = database.execute("""SELECT p.id, p.timestamp, s.name AS storeName, SUM(i.price) AS priceSum
                              FROM purchase p, store s, item i
                              WHERE p.storeid = s.id AND i.purchaseid = p.id
                              GROUP BY i.purchaseid
                              ORDER BY p.timestamp DESC;""")
    rows = cur.fetchall()
    purchases = []
    #pdict = {'purchaselist': [ dict(row) for row in rows ]}
    for row in rows:
        purchase_dict = dict(row)
        purchase_dict['time'] = datetime.datetime.fromtimestamp(purchase_dict['timestamp']).strftime('%d.%m.%Y %H:%M')
        purchase_dict['yearmonth'] = datetime.datetime.fromtimestamp(purchase_dict['timestamp']).strftime('%Y-%m')
        purchase_dict['sum'] = helper.to_string_price(purchase_dict['priceSum'])
        del purchase_dict['timestamp']
        purchases.append(purchase_dict)

    pmap = {}
    for p in purchases:
        yearmonth = p['yearmonth'] 
        if not yearmonth in pmap:
            pmap[yearmonth] = [] 
        pmap[yearmonth].append(p)

    rlist = []
    for yearmonth in pmap:
        ps = pmap[yearmonth]
        monthSum = helper.to_string_price(sum([p['priceSum'] for p in ps]))
        rlist.append({'year': yearmonth[:4], 'month': yearmonth[-2:], 'monthSum': monthSum, 'purchases': ps})

    return {'purchaseslist': rlist}

def get_store_by_name(storename):
    database = db.get_db()
    cur = database.execute(""" SELECT id
                                FROM store
                                WHERE store.name = ?
                                """, [storename])
    rows = [dict(row) for row in cur.fetchall()]
    if len(rows) < 1:
        return None
    return rows[0]['id']

def save_purchase_from_zettel(receipt):
    return create_purchase_from_zettel(receipt.timestamp, receipt.store, receipt.items)

def create_purchase_from_zettel(timestamp, storename, items):
    app.logger.debug("Create purchase from zettel")
    app.logger.debug("get store id for name '{}'".format(storename))
    storeid = get_store_by_name(storename)
    app.logger.debug("Returned Storeid: {}".format(storeid))
    app.logger.debug("Create a purchase")
    purchaseid = create_purchase(timestamp, storeid)
    app.logger.debug("Returned Purchase Id: {}".format(purchaseid))
    for itemname in items:
        quantity = items[itemname][0]
        price = items[itemname][1]
        #app.logger.debug("{}x {} : {}".format(quantity, itemname, price))
        ### HARD CODED CATEGORY ID!!
        item.create_item(itemname, price, quantity, purchaseid)
    app.logger.debug("{} items inserted succesfully (probably..)".format(len(items)))

    return "great success"


def create_purchase(timestamp, storeid):
    database = db.get_db()
    cur = database.execute("""INSERT INTO purchase
                        (timestamp, storeid)
                        values
                        (?, ?);""",
                        [timestamp, storeid])
    purchaseid = cur.lastrowid
    database.commit()
    app.logger.debug("Inserted purchase: {}".format(purchaseid))
    return purchaseid

