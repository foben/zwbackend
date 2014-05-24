from zwbackend import db

def get_all_purchases():
    database = db.get_db()
    cur = database.execute("""SELECT p.id, p.timestamp, s.name AS storeName FROM purchase p, store s
                              WHERE p.storeid = s.id;""")
    rows = cur.fetchall()
    purchases = {}
    pdict = {'purchaselist': [ dict(row) for row in rows ]}
    return pdict
