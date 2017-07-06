sudo apt-get update
sudo apt-get install python-pip python-dev libpq-dev nginx virtualenv

mkdir ~/django-test
cd ~/django-test

virtualenv env
source env/bin/activate

pip install django djangorestframework

django-admin startproject myproject .

cp myproject/settings.py myproject/settings_backup.py
sed 's/\'django.contrib.staticfiles\',/\'django.contrib.staticfiles\',\n\'rest_framework\',/g' myproject/settings_backup.py > myproject/settings.py
