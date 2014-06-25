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

Restart Apache:

    sudo service apache2 restart
    
Copy static content to apache folder:

    sudo cp -a web_app/* /var/www/html/zettelwirtschaft/

1) Install python and module dependencies:
    
    sudo apt-get install python-pip python-dev python-imaging
    sudo pip install pytesseract
    sudo pip install Flask

2) Install tesseract OCR
    
    sudo apt-get install tesseract-ocr

3) Create the database with the demo data:

    python create_db.py

4) Run the server

    python runserver.py
    

