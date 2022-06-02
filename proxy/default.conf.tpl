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
        proxy_pass https://mekar-jek.mekar-dev.xyz/;

        proxy_set_header Host mekar-jek.mekar-dev.xyz;
        proxy_set_header X-Real-IP 34.149.116.151;
        proxy_set_header X-Forwarded-For 34.149.116.151;
        proxy_set_header X-Forwarded-Proto https;

    # proxy_redirect off;
        proxy_redirect http://fillateo.my.id/ayam/ https://mekar-jek.mekar-dev.xyz ;

    }
}
