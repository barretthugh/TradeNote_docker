FROM nginx:alpine

COPY addclasses.sh /addclasses.sh
COPY entrypoint.sh /entrypoint.sh

RUN apk update \
  && apk add nano npm wget bash --no-cache coreutils git \
  && npm install --global gulp-cli

RUN mkdir -p /usr/share/nginx/html/tmp/ \
  && cd /usr/share/nginx/html/tmp/ \
  && git clone https://github.com/Eleven-Trading/TradeNote.git \
  && cd TradeNote \
  && npm install \
  && chmod +x /addclasses.sh \
  && chmod +x /entrypoint.sh

WORKDIR /usr/share/nginx/html/

EXPOSE 7777


ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
