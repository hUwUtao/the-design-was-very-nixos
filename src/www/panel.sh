mkdir ./pterodactyl
cd pterodactyl
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar xvz
chmod -R 755 storage/* bootstrap/cache/
ln ../../../secrets/pterodactyl.env ./.env