#!/bin/bash
emergency_message= echo "AP web connection is high"
LOG_DATE='date +%Y-%m-%d-%H'
MAIL_LIST="email-address"
STATUS=${netstat -ant | grep -E ':80|:443'|grep ESTAB|wc -l}
if [$STATUS -le 150]; then
echo "AP web connection is OK" $STATUS
else
/usr/sbin/sendmail -t <<EOF
Content-type: text/html
To:$MAIL_LIST
Subject:[$LOG_DATE][Warning!! Ap Web connection is high!! Please Check AP Web!!]
echo $emergency_message $STATUS
EOF
fi
