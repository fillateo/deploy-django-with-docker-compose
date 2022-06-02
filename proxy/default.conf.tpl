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
        proxy_redirect / /ayam/;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
    }
}

server {
    listen 80;

    # location /static {
    #     alias /vol/static;
    # }

    # location / {
    #     uwsgi_pass              ${APP_HOST}:${APP_PORT};
    #     include                 /etc/nginx/uwsgi_params;
    #     client_max_body_size    10M;
    # }

    location ^~ /ayam/ {
        proxy_redirect / /ayam/;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
    }
}
