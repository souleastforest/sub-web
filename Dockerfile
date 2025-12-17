# ---- Dependencies ----
FROM node:22-alpine AS build
WORKDIR /app
COPY . .
RUN npm install -g bun && bun install
RUN bun run build

FROM nginx:1.24-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
