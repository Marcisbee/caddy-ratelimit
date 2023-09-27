FROM caddy:2.7.4-builder-alpine as builder

RUN XCADDY_GO_BUILD_FLAGS='-tags=memoize_builders' xcaddy build \
    --with github.com/mholt/caddy-ratelimit \
		--with github.com/corazawaf/coraza-caddy/v2

FROM caddy:2.7.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
