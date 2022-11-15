FROM 786661668075.dkr.ecr.us-east-1.amazonaws.com/node:12.18.4-alpine3.10 as dependencies
WORKDIR /api-jwt
COPY . .
RUN npm install --frozen-lockfile
RUN apk --no-cache add curl
EXPOSE 4001
CMD ["npm", "start"]
