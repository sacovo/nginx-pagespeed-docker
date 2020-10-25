FROM debian:buster-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo curl -y

COPY install.sh .
RUN bash ./install.sh --nginx-version latest -y

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
