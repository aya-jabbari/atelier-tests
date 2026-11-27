FROM node:22-alpine AS deps

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

FROM node:22-alpine

ENV NODE_ENV=production

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules

COPY package.json ./
COPY src ./src
COPY public ./public

# Supprimer les outils inutiles en production
RUN rm -rf /usr/local/lib/node_modules/npm \
    /usr/local/bin/npm \
    /usr/local/bin/npx

USER node

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget -qO- http://localhost:3000/login.html || exit 1

CMD ["node", "src/server.js"]