server {
    listen ${LISTEN_PORT};

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location /static {
        alias /vol/static;
    }

    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name fillateo.my.id;

    ssl_certificate /etc/letsencrypt/live/fillateo.my.id/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/fillateo.my.id/privkey.pem;
    
    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
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