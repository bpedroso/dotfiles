#!/bin/bash

user=$1
pass=$2
proxy_ip='100.68.1.80'
proxy_port=443

noProxy() {
  gsettings reset-recursively org.gnome.system.proxy
}

c4Proxy() {
  gsettings set org.gnome.system.proxy use-same-proxy true
  gsettings set org.gnome.system.proxy mode 'manual'
  gsettings set org.gnome.system.proxy.http host $proxy_ip
  gsettings set org.gnome.system.proxy.http port $proxy_port
  gsettings set org.gnome.system.proxy.http use-authentication true
  gsettings set org.gnome.system.proxy.http authentication-password $pass
  gsettings set org.gnome.system.proxy.http authentication-user $user
  gsettings set org.gnome.system.proxy.http enabled true

  gsettings set org.gnome.system.proxy.ftp host $proxy_ip
  gsettings set org.gnome.system.proxy.ftp port $proxy_port
  gsettings set org.gnome.system.proxy.socks host $proxy_ip
  gsettings set org.gnome.system.proxy.socks port $proxy_port
  gsettings set org.gnome.system.proxy.https host $proxy_ip
  gsettings set org.gnome.system.proxy.https port $proxy_port
  gsettings set org.gnome.system.proxy.socks host $proxy_ip
  gsettings set org.gnome.system.proxy.socks port $proxy_port

  gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '127.0.0.0/8', 'jenkins.ecom.carrefour', '::1', '100.68.3.193', 'carrefour.local', '*.wcorp.carrefour.com', 'rabbitmq.noprod.ecom.carrefour', 'rabbitmq.ecom.carrefour']"
}

if [ "$1" = "off" ]; then
  echo "deactivating proxy" & noProxy
else
  echo "activating proxy to $user"

  if [ $# -lt 2 ]; then
    echo "Para ativar, passar usuário e senha."
    echo "eg.: $0 on user pass"
  else
    c4Proxy
  fi
fi

gsettings list-recursively org.gnome.system.proxy
