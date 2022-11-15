FROM 786661668075.dkr.ecr.us-east-1.amazonaws.com/node:12.18.4-alpine3.10 as dependencies
WORKDIR /api-jwt
COPY . .
RUN yarn install --frozen-lockfile

FROM 786661668075.dkr.ecr.us-east-1.amazonaws.com/node:12.18.4-alpine3.10 as builder
WORKDIR /api-jwt
COPY --from=dependencies /api-jwt .
COPY ./.env .

RUN yarn install

RUN apk --no-cache add curl

FROM 786661668075.dkr.ecr.us-east-1.amazonaws.com/node:12.18.4-alpine3.10 as runner
WORKDIR /api-jwt
COPY --from=builder /api-jwt .

EXPOSE 4001
CMD ["yarn", "start"]
