server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

    location / {
        proxy_redirect              off;
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }

    location ^~ /ayam {
        proxy_redirect              off;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
        proxy_set_header Host mekar-jek.mekar-dev.xyz;

    }
}
