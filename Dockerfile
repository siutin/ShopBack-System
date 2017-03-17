FROM siutin/ubuntu-rails-apache-passenger-ssh:v2.4.7_5.0.30_5.0.1_2.3.1_20170106
MAINTAINER Martin Chan <osiutino@gmail.com>
ENV REFRESHED_AT 2017-03-17

USER root

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install libmysqlclient-dev -y
RUN apt-get install libyaml-dev -y
RUN apt-get install imagemagick -y
RUN apt-get install build-essential -y
RUN apt-get install vim -y
RUN apt-get install mysql-client -y

# -----------------------------------------------------------

RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_connect
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod socache_shmcb
RUN a2enmod ssl
#RUN apachectl restart

# -----------------------------------------------------------

RUN echo "Asia/Hong_Kong" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

# -----------------------------------------------------------

USER worker
WORKDIR /home/worker/

# RUN echo "RAILS_ENV=production" >> /home/worker/.bash_profile
 
COPY main.sh /home/worker/

CMD ["/home/worker/main.sh"]
