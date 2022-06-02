server {
    listen ${LISTEN_PORT};

    location ^~ /ayam/ {

        proxy_set_header Host www.google.com;
        proxy_set_header X-Real-IP 142.251.32.4;
        # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;

        proxy_pass https://www.google.com/;
    }
}
