============
Installation
============
0) Set up Apache for serving the static files (Ubunt 14.04):

    $ sudo apt-get install apache2-mpm-worker
    $ sudo a2enmod proxy_http
    
Add a Proxy to /etc/apache2/sites-enabled/000-default.conf

    ProxyPass /zettelwirtschaft !
    ProxyPass / http://ec2-54-76-99-61.eu-west-1.compute.amazonaws.com/
    ProxyPassReverse / http://ec2-54-76-99-61.eu-west-1.compute.amazonaws.com/
    
Copy static content to apache folder:

    sudo cp -a web_app/* /var/www/html/zettelwirtschaft/


1) Initialize a database from a python shell:

    >>> from zwbackend import db
    >>> db.init_db()

2) Run the server

    $ python runserver.py
    

