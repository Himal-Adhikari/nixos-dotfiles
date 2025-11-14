#!/usr/bin/env bash
 
curl -k 'https://10.100.1.1:8090/login.xml' -X POST -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0' -H 'Accept: /' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: https://10.100.1.1:8090/' -H 'Connection: keep-alive' -H 'Referer: https://10.100.1.1:8090/httpclient.html' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'DNT: 1' -H 'Sec-GPC: 1' --data-raw 'mode=191&username=079bel035&password=2022-4691&a=1704110477577&producttype=0'

