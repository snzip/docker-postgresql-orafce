FROM postgres:15




ENV PG_APP_HOME="/etc/docker-postgresql" \
    PG_VERSION=15.8 \
    PG_USER=postgres \
    PG_HOME=/var/lib/postgresql/15 \
    PG_RUNDIR=/run/postgresql \
    PG_LOGDIR=/var/log/postgresql \
    PG_CERTDIR=/etc/postgresql/certs \
    ORAFCE_VERSION=4_10_3 \
    PLDEBUGGER_VERSION=1.5

RUN apt  -y update \ 
&& apt install -y make wget gcc postgresql-server-dev-15  postgresql-15-pldebugger vim


ENV PATH $PATH:/var/lib/postgresql/bin
ENV PGDATA /var/lib/postgresql/data

COPY ./pg_hba.conf ${PGDATA}/pg_hba.conf
 
#  install 4_10_3 postgresql-15-orafce
RUN cd /tmp \ 
&&  wget  https://codeload.github.com/orafce/orafce/tar.gz/refs/tags/VERSION_${ORAFCE_VERSION} -O orafce.tar.gz \
&& tar xvzf orafce.tar.gz \
&& mv /tmp/orafce-VERSION_${ORAFCE_VERSION} /usr/share/postgresql/15/extension/ \
&& cd /usr/share/postgresql/15/extension/orafce-VERSION_${ORAFCE_VERSION} \
&& make \
&& make install 



ENV POSTGRES_PASSWORD=postgres

VOLUME /var/lib/postgresql/data


ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]