FROM klakegg/hugo:0.107.0-ext-alpine-ci as builder
COPY . /src
RUN hugo --minify

# Update the base image digest and name in the release workflow file as well
# when bumping the caddy version!
FROM caddy:2.8.4
COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=builder /src/public /srv
