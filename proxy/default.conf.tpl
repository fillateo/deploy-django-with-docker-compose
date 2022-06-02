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

    location ^~ /ayam {
        server_name  fillateo.my.id;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
        proxy_set_header Host mekar-jek.mekar-dev.xyz;
        proxy_redirect https://fillateo.my.id/ /ayam;

    }
}
