server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location ^~ /ayam/ {
        proxy_redirect https://mekar-jek.mekar-dev.xyz/ http://${APP_HOST}:${APP_PORT}/;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
    }
}
