#!/bin/bash
file=incoming/file.txt
bucket=sftp-test-dixio
resource="/${bucket}/${file}"
contentType="text/plain"
dateValue=`date -R`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=AKIA6LSIHPIHA4XZY3FZ
s3Secret=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
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
curl -L -X PUT -T "${file}" \
  -H "Host: ${bucket}.s3.amazonaws.com" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Authorization: AWS ${s3Key}:${signature}" \
  https://${bucket}.s3.amazonaws.com/${file}
