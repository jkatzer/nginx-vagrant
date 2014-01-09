#!/usr/bin/env bash

# Install junk
apt-get update
apt-get install -y nginx


# Config nginx
nginx_default_site='/etc/nginx/sites-enabled/default'
sites_enabled="/etc/nginx/sites-enabled"
sites_available="/etc/nginx/sites-available"

v_nginx_config="/vagrant/nginx/nginx.conf"
nginx_config="/etc/nginx/nginx.conf"

v_nginx_devsite="/vagrant/nginx/dev"
nginx_devsite_name="dev"

ssl_path="/etc/nginx/ssl"
v_ssl_path="/vagrant/nginx/ssl"

www_path="/usr/share/nginx/www"
v_www_path="/vagrant/www"

v_log_path="/vagrant/log/nginx"

if [ -e "$nginx_default_site" ]; then
    rm "$nginx_default_site"
fi

# clear any existing configs
if [ -d "$sites_enabled" ]; then
    rm -rf "$sites_enabled"
fi

if [ -d "$sites_available" ]; then
    rm -rf "$sites_available"
fi

if [ -e "$nginx_config" ]; then
    rm "$nginx_config"
fi

# re-add the sites dirs we just deleted
mkdir "$sites_available"
mkdir "$sites_enabled"

cp "$v_nginx_config" "$nginx_config"

cp "$v_nginx_devsite" "$sites_available"/"$nginx_devsite_name"
ln -s "$sites_available"/"$nginx_devsite_name" "$sites_enabled"/"$nginx_devsite_name"

if [ ! -d "$ssl_path" ]; then
	mkdir "$ssl_path"
fi

cp "$v_ssl_path"/* "$ssl_path"/

rm -rf "$www_path"
ln -s "$v_www_path" "$www_path"

mkdir -p "$v_log_path"

# Start nginx
nginx -s stop
nginx 
