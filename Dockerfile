FROM nginx:1.21.0
RUN apt update
RUN apt install parallel -y
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY BOT.txt /BOT.txt
CMD parallel </BOT.txt
#CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
