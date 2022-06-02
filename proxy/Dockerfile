FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="londonappdeveloper.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

RUN sudo apt install software-properties-common \
    sudo add-apt-repository ppa:certbot/certbot \
    sudo apt update \
    sudo apt install certbot python-certbot-nginx \
    sudo certbot --authenticator webroot --installer nginx -w /etc/nginx/ --agree-tos --redirect --staple-ocsp -d fillateo.my.id --email jaitramadandij@gmail.com

VOLUME /vol/static

USER nginx

CMD ["/run.sh"]
