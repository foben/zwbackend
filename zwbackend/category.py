from zwbackend import db, helper
from zwbackend import app
import datetime

"""
category chart (purchase)
group items by category 
output: liste von (categoryName, kosten (als float))
"""
def get_categories_of_purchase(purchase_id):
    database = db.get_db()
    cur = database.execute("""SELECT c.name, SUM(i.price) AS sum
                              FROM purchase p, item i, category c 
                              WHERE p.id = %d AND i.purchaseid = p.id
                                AND c.id = i.categoryid
                              GROUP BY c.id;""" % purchase_id)
    rows = cur.fetchall()
    categories = [dict(row) for row in rows]
    return {'productCategories': categories}

"""
category chart (monthly)
"""
