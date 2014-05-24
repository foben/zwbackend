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
