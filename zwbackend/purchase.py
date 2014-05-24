from zwbackend import db

def get_all_purchases():
    database = db.get_db()
    cur = database.execute("""SELECT * FROM purchase;""")
    rows = cur.fetchall()
    purchases = {}
    pdict = {'purchaselist': [ dict(row) for row in rows ]}
    return pdict
