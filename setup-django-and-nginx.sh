sudo apt-get update
sudo apt-get install python-pip python-dev libpq-dev nginx virtualenv

mkdir ~/django-test
cd ~/django-test

virtualenv env
source env/bin/activate

pip install django djangorestframework gunicorn psycopg2

django-admin startproject myproject .

cp myproject/settings.py myproject/settings_backup.py
wget 'https://raw.githubusercontent.com/wuchlei-thu/nginx-django-config/master/settings.py'
mv settings.py myproject/settings.py

python manage.py migrate
python manage.py createsuperuser
python manage.py collectstatic

deactivate

