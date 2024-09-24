#!/bin/bash -x

export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_REGION="us-east-1"

CERTIFICATE_ID=$(aws acm request-certificate --domain-name www.example.com \
   --validation-method DNS \
   --idempotency-token 1234 \
   --options CertificateTransparencyLoggingPreference=DISABLED \
   --endpoint-url http://localhost:4566 --output text | cut -d '/' -f 2)

echo $CERTIFICATE_ID