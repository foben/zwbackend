from zwbackend import db
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
