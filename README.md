============
Installation
============
0) Set up Apache for serving the static files (Ubunt 14.04):

    $ sudo apt-get install apache2-mpm-worker
    $ sudo a2enmod proxy_http
    
Add a Proxy to /etc/apache2/sites-enabled/000-default.conf

    ProxyPass /zettelwirtschaft !
    ProxyPass / http://localhost:5000/
    ProxyPassReverse / http://localhost:5000/
    
Copy static content to apache folder:

    sudo cp -a web_app/* /var/www/html/zettelwirtschaft/

1) Install dependencies:
    
    sudo pip install pytesseract
    sudo pip install Flask

2) Initialize a database from a python shell:

    >>> from zwbackend import db
    >>> db.init_db()

3) Run the server

    $ python runserver.py
    

