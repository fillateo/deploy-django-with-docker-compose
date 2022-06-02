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
        proxy_set_header Host $APP_HOST;
        proxy_set_header X-Real-IP 34.149.116.151;
        proxy_set_header X-Forwarded-For 34.149.116.151;
        proxy_pass https://34.149.116.151:443;
    }
}
