from zwbackend import db
from zwbackend import app
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
                              ORDER BY p.timestamp;""")
    rows = cur.fetchall()
    purchases = []
    #pdict = {'purchaselist': [ dict(row) for row in rows ]}
    for row in rows:
        purchase_dict = dict(row)
        purchase_dict['time'] = datetime.datetime.fromtimestamp(purchase_dict['timestamp']).strftime('%d.%m.%Y %H:%M')
        purchase_dict['yearmonth'] = datetime.datetime.fromtimestamp(purchase_dict['timestamp']).strftime('%Y-%m')
        purchase_dict['sum'] = str(purchase_dict['priceSum'])[:4].replace('.',',')
        del purchase_dict['timestamp']
        del purchase_dict['priceSum']
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
        rlist.append({'year': yearmonth[:4], 'month': yearmonth[-2:], 'purchases': ps})

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

def create_purchase_from_zettel(timestamp, storename, items):
    app.logger.debug("Create purchase from zettel")
    app.logger.debug("get store id for name '{}'".format(storename))
    storeid = get_store_by_name(storename)
    app.logger.debug("Returned Storeid: {}".format(storeid))
    app.logger.debug("Create a purchase")
    purchaseid = create_purchase(timestamp, storeid)
    app.logger.debug("Returned Purchase Id: {}".format(purchaseid))
    for item in items:
        quantity = items[item][0]
        price = items[item][1]
        app.logger.debug("{}x {} : {}".format(quantity, item, price))

    return "foo"


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

