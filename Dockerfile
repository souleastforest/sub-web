# ---- Dependencies ----
FROM oven/bun:alpine AS build
WORKDIR /app
COPY . .
RUN bun install
RUN bun run build

FROM nginx:1.24-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
