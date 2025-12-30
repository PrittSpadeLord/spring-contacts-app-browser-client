# Generate nodejs stage
FROM node:24.11.1-trixie AS node

WORKDIR /app

COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./

RUN corepack enable && corepack install && pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

# Generate nginx stage
FROM nginx:1.28.1-trixie AS nginx

# Set up the runtime
FROM scratch

COPY --from=node /app/dist /usr/share/nginx/html
COPY --from=node /app/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=nginx /var/cache/nginx /var/cache/nginx
COPY --from=nginx /var/log/nginx /var/log/nginx
COPY --from=nginx /etc/nginx /etc/nginx

COPY --from=nginx /usr/sbin/nginx /usr/sbin/nginx

COPY --from=nginx /lib64/ld-linux-x86-64.so.2* /lib64/
COPY --from=nginx /lib/ld-linux-aarch64.so.1* /lib/

COPY --from=nginx /lib/x86_64-linux-gnu/libcrypt.so.1* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libpcre2-8.so.0* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libssl.so.3* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libcrypto.so.3* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libz.so.1* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libc.so.6* /lib/x86_64-linux-gnu/
COPY --from=nginx /lib/x86_64-linux-gnu/libzstd.so.1* /lib/x86_64-linux-gnu/

COPY --from=nginx /etc/passwd /etc/passwd
COPY --from=nginx /etc/group /etc/group
COPY --from=nginx /etc/nsswitch.conf /etc/nsswitch.conf
COPY --from=nginx /run /run

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]