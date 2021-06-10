#!/bin/sh
NEW_IP=`wget -O — -q http://ident.me/`
CURRENT_IP=`cat /var/tmp/current_ip.txt`

if [ “$NEW_IP” = “$CURRENT_IP” ]
then
  echo "No Change in IP Adddress"
else
  curl https://www.cloudflare.com/api_json.html \
  -d 'a=rec_edit' \
  -d 'tkn=RU__uv9fC5sDoI_qVDBV8cKjgUoGoB94li7pJz7U' \
  -d 'email=thinhplust@gmail.com' \
  -d 'z=lungmat.net' \
  -d 'id=record-id' \
  -d 'type=A' \
  -d 'name=emby.lungmat.net' \
  -d 'ttl=1' \
  -d "content=$NEW_IP"
  echo $NEW_IP > /var/tmp/current_ip.txt
fi
