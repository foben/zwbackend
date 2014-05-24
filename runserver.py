import logging
from zwbackend import app
from logging.handlers import RotatingFileHandler
handler = RotatingFileHandler('applog.log', maxBytes=10000, backupCount=1)
handler.setLevel(logging.DEBUG)
app.logger.addHandler(handler)
app.run('0.0.0.0', debug=True)
