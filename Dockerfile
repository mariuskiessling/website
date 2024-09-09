FROM klakegg/hugo:0.111.3-ext-alpine-ci as builder
COPY . /src
RUN hugo --minify

# Update the base image digest and name in the release workflow file as well
# when bumping the caddy version!
FROM caddy:2.6.4
COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=builder /src/public /srv
