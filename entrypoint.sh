#!/bin/bash

set -e

cd /usr/share/nginx/html/tmp/TradeNote \
  && gulp prod --PARSE_APP_ID $PARSE_APP_ID --PARSE_URL $PARSE_URL \
  && cp /usr/share/nginx/html/tmp/TradeNote/nginx.conf /etc/nginx/nginx.conf \
  && cp -R /usr/share/nginx/html/tmp/TradeNote/dist/* /usr/share/nginx/html/ \
  && cd /usr/share/nginx/html/ \
  && rm -r /usr/share/nginx/html/tmp

exec "$@"
