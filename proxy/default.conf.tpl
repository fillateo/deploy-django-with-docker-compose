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
        proxy_redirect / http://fillateo.my.id/ayam/;
        proxy_pass https://mekar-jek.mekar-dev.xyz/;
    }
}

# server {
#         listen 443 ssl default_server;
#         listen [::]:443 ssl default_server;
#         ssl_certificate /etc/nginx/certificate/nginx-certificate.crt;
#         ssl_certificate_key /etc/nginx/certificate/nginx.key;
#         root /var/www/html;
#         index index.html index.htm index.nginx-debian.html;
#         server_name _;
#         location / {
#                 try_files $uri $uri/ =404;
#         }
# }