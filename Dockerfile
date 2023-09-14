FROM caddy:2.7.4-builder-alpine as builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2.7.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
