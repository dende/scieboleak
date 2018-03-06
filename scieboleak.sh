#!/bin/bash
cookie=$(cat cookie | tr -d '\n')
requesttoken=$(cat requesttoken | tr -d '\n')
IFS=$'\n'
for uniid in $(sed -n "$1,$2p" l.txt)
do
(>&2 echo $uniid)
curl -s "https://uni-bonn.sciebo.de/ocs/v1.php/apps/files_sharing/api/v1/sharees?format=json&search=$uniid%40uni-bonn.de&perPage=200&itemType=folder" -H "Cookie: $cookie" -H "requesttoken: $requesttoken" -H 'Accept-Encoding: gzip, deflate, sdch, br' -H 'Accept-Language: de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/57.0.2987.98 Chrome/57.0.2987.98 Safari/537.36' -H 'OCS-APIREQUEST: true' -H 'Accept: */*' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --compressed | python -c 'import sys, json; print json.load(sys.stdin)["ocs"]["data"]["exact"]["users"][0]["label"]'
done
