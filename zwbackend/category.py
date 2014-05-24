from zwbackend import db, helper
from zwbackend import app
import datetime

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
