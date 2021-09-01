# commands
```bash
docker-compose run web django-admin startproject django_dev . && \
sed -i -e "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE': 'django.db.backends.postgresql',/" django_devsettings.py && \
sed -i -e "s/'NAME': BASE_DIR \/ 'db.sqlite3',/'NAME': 'postgres',\n        'USER': 'postgres',\n        'PASSWORD': 'postgres',\n        'HOST': 'db',\n        'PORT': 5432,\n/" django_dev/settings.py && \
sed -i -e "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['localhost', '127.0.0.1', '192.168.1.100'\]/" django_dev/settings.py && \
docker-compose up -d
```
  
# fix
プロジェクト名は django_dev としています。  
2回目の sed の DB情報を docker-compose.yaml に合わせて修正してください。  
3回目の sed の ALLOWED_HOSTS を サーバのIPアドレスを記載 してください。  