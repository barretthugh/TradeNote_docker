FROM alpine
RUN apk update && apk add nano npm nodejs wget bash --no-cache coreutils git

RUN git clone https://github.com/Eleven-Trading/TradeNote
RUN mv TradeNote/ app
WORKDIR /app

RUN npm install
RUN npm run build

CMD ["npm", "start"]
