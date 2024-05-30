#!/usr/bin/bash
rpg() {
    head -c 2048 /dev/urandom \
    | openssl sha512 -binary \
    | tail -c 33 | base64
    # | tail -c 129
}

MDB_PWD='mdb/$(rpg)'

echo "MARIADB_ROOT_PASSWORD=\"$MDB_PWD\"" > .env

PT_PWD='pt@%/$(rpg)'
echo "DB_PASSWORD=\"$PT_PWD\""

echo "
create user 'pt'@'%' identified by '$PT_PWD';
create database panel;
grant all privileges on panel.* TO pt@'%' with grant option;
flush privileges;
" | mariadb -h127.0.0.1 -uroot -p"$MDB_PWD"

docker compose up --build --pull=always -d