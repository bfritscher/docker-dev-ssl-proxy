FROM nginx

RUN apt-get update \
	&& apt-get install openssl \
	&& rm -rf /var/lib/apt/lists/*

# Generate our self-signed certificate
RUN mkdir -p /ssl
WORKDIR /ssl
RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

# TODO: Devise another way of string replacements for master branch
COPY virtual-site.template /etc/nginx/conf.d/default.conf

CMD ["/bin/bash", "-c", "exec nginx -g 'daemon off;'"]
