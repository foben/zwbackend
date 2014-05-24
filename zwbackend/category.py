from zwbackend import app
import datetime
from zwbackend import db, helper

def get_categoryid_for_itemname(itemname):
    database = db.get_db()
    cur = database.execute("""SELECT categoryid from mappings
                        WHERE mappings.item = ? """,
                        [itemname])
    rows = [ dict(row) for row in cur.fetchall() ]
    if len(rows) < 1:
        return None
    return rows[0]['categoryid']

def get_categories():
    database = db.get_db()
    cur = database.execute("""SELECT * FROM category; """)
    rows = [dict(row) for row in cur.fetchall()]
    return rows

def get_mappings():
    database = db.get_db()
    cur = database.execute("""SELECT * FROM mappings; """)
    rows = [dict(row) for row in cur.fetchall()]
    return rows

def get_categories_of_purchase(purchase_id):
    database = db.get_db()
    cur = database.execute("""SELECT c.name, SUM(i.price) AS sum
                              FROM purchase p, item i, category c 
                              WHERE p.id = %d AND i.purchaseid = p.id
                                AND c.id = i.categoryid
                              GROUP BY c.id;""" % purchase_id)
    rows = cur.fetchall()
    categories = [dict(row) for row in rows]
    return {'productCategories': [[c['name'], c['sum']] for c in categories]}

#def get_categories_by_month(year, month):
#    database = db.get_db()
#    cur = database.execute("""SELECT 
#                              FROM purchase p, item i, category c 
#                              WHERE i.purchaseid = p.id AND c.id = i.categoryid
#                                AND datetime(1092941466, 'unixepoch')
#                              GROUP BY c.id;""")
#    rows = cur.fetchall()
#    categories = [dict(row) for row in rows]
#    return {'productCategories': categories}
