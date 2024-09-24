#!/bin/bash -x

export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"
export AWS_REGION="$AWS_REGION"

CERTIFICATE_ID=$(aws acm request-certificate --domain-name www.example.com \
   --validation-method DNS \
   --idempotency-token 1234 \
   --options CertificateTransparencyLoggingPreference=DISABLED \
   --endpoint-url $ACM_ENDPOINT_URL --output text | cut -d '/' -f 2)

echo $CERTIFICATE_ID