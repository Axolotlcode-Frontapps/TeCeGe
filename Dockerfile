FROM oven/bun:1 AS build
WORKDIR /app

COPY . .

RUN bun install
RUN bun run build

FROM nginx:alpine AS runtime
COPY --from=build /app/dist /usr/share/nginx/html/
EXPOSE 80