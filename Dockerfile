FROM node

RUN apt update && apt install nginx supervisor -y

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD start.sh /start.sh

ADD index.html /var/www/html/index.nginx-debian.html

ADD app.js /app/

# Expose Port
EXPOSE 80 3000

ENTRYPOINT ["/bin/bash","/start.sh","-c"]
