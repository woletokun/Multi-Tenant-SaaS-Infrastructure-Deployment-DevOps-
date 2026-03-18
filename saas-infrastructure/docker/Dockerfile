# build
FROM node:20-alpine AS builder

WORKDIR /app

# Accept the arguments
ARG VITE_API_BASE_URL
ARG VITE_APP_ACCESS_TOKEN
ARG VITE_APP_TENANT_KEY
ARG VITE_APP_TENANT_ID

# Set them as environment variables for the build process
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
ENV VITE_APP_ACCESS_TOKEN=$VITE_APP_ACCESS_TOKEN
ENV VITE_APP_TENANT_KEY=$VITE_APP_TENANT_KEY
ENV VITE_APP_TENANT_ID=$VITE_APP_TENANT_ID

COPY package*.json ./
RUN npm install

COPY . .

# ENV VITE_API_BASE_URL=/api

RUN NODE_OPTIONS="--max-old-space-size=1536" npm run build

# RUN npm run build


# serve 
FROM nginx:alpine

# SPA routing
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY api.conf /etc/nginx/conf.d/api.conf

COPY --from=builder /app/dist /usr/share/nginx/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
