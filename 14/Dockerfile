FROM postgres:14.13




ENV PG_APP_HOME="/etc/docker-postgresql" \
    PG_VERSION=14.13 \
    PG_USER=postgres \
    PG_HOME=/var/lib/postgresql/14 \
    PG_RUNDIR=/run/postgresql \
    PG_LOGDIR=/var/log/postgresql \
    PG_CERTDIR=/etc/postgresql/certs \
    ORAFCE_VERSION=3_24_0 \
    PLDEBUGGER_VERSION=1.5

RUN apt  -y update \ 
&& apt install -y make wget gcc postgresql-server-dev-14  postgresql-14-pldebugger


ENV PGDATA /var/lib/postgresql/data
 
#  install 3.24. postgresql-14-orafce
RUN cd /tmp \ 
&&  wget  https://codeload.github.com/orafce/orafce/tar.gz/refs/tags/VERSION_${ORAFCE_VERSION} -O orafce.tar.gz \
&& tar xvzf orafce.tar.gz \
&& mv /tmp/orafce-VERSION_${ORAFCE_VERSION} /usr/share/postgresql/15/extension/ \
&& cd /usr/share/postgresql/14/extension/orafce-VERSION_${ORAFCE_VERSION} \
&& make \
&& make install 



ENV POSTGRES_PASSWORD=postgres

VOLUME /var/lib/postgresql/data


ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]