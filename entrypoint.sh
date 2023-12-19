#!/bin/sh
python manage.py migrate
python manage.py collectstatic --noinput
python manage.py compilemessages -l de

if [ -z "$PORT" ]; then
  export PORT=8000
fi
/usr/local/bin/gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 geeksTaks.wsgi