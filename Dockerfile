FROM klakegg/hugo:0.91.2-ext-alpine-ci as builder
COPY . /src
RUN hugo --minify

FROM caddy:2.4.6
COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=builder /src/public /srv
