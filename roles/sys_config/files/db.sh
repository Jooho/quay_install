mkdir -p /var/lib/pgsql/data
chmod 777 /var/lib/pgsql/data

docker rm postgresql_database -f

docker run -d --name postgresql_database \
    -v /var/lib/pgsql/data:/var/lib/pgsql/data:Z  \
    -e POSTGRESQL_USER=quayuser -e POSTGRESQL_PASSWORD=quaypass \
    -e POSTGRESQL_DATABASE=quaydb -p 5432:5432 \
    rhscl/postgresql-96-rhel7

sleep 10

docker exec postgresql_database /bin/bash -c 'echo "SELECT * FROM pg_available_extensions" | /opt/rh/rh-postgresql96/root/usr/bin/psql'

docker exec postgresql_database /bin/bash -c 'echo "CREATE EXTENSION IF NOT EXISTS pg_trgm;" | /opt/rh/rh-postgresql96/root/usr/bin/psql -d quaydb'

docker exec postgresql_database /bin/bash -c 'echo "SELECT * FROM pg_extension" | /opt/rh/rh-postgresql96/root/usr/bin/psql'

docker exec postgresql_database /bin/bash -c 'echo "ALTER USER quayuser WITH SUPERUSER;" | /opt/rh/rh-postgresql96/root/usr/bin/psql'
