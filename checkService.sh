#!/bin/bash
emergency_message= echo "SERVICE is Down! Please Check Service!!"
LOG_DATE='date +%Y-%m-%d-%H'
MAIL_LIST="email-address"
STATUS=${curl -s -k -o /dev/null -w '%{http_code} http://URL'}
if [$STATUS -eq 200]; then
echo "Mysite is UP" $STATUS
else
/usr/sbin/sendmail -t <<EOF
Content-type: text/html
To:$MAIL_LIST
Subject:[$LOG_DATE][Warning!! My site is Down!! Please Check Service!!]
echo $emergency_message $STATUS
EOF
fi