FROM oven/bun:1 AS base
WORKDIR /app

COPY . .

COPY package.json bun.lockb* ./

RUN bun install
RUN bun run build

FROM httpd:2.4 AS runtime
COPY --from=base /app/dist /usr/local/apache2/htdocs/
EXPOSE 8000