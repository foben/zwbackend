from zwbackend import db

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

def create_item(name, price, quantity, purchaseid, categoryid):
    database = db.get_db()
    cur = database.execute("""INSERT INTO item
                            (name, price, quantity, purchaseid, categoryid)
                            values
                            (?, ?, ?, ?, ?);""",
                            [name, price, quantity, purchaseid, categoryid])
