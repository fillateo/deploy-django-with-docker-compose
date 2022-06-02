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

    location /ayam {
        proxy_set_header Host jexdev.pesankilat.com;
        proxy_set_header X-Real-IP 128.199.173.69;
        proxy_set_header X-Forwarded-For 128.199.173.69;
        proxy_pass https://jexdev.pesankilat.com/;

    }
}
