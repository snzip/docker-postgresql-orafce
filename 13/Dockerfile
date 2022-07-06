FROM centos:7



ENV PG_APP_HOME="/etc/docker-postgresql" \
    PG_VERSION=13 \
    PG_USER=postgres \
    PG_HOME=/var/lib/postgresql \
    PG_RUNDIR=/run/postgresql \
    PG_LOGDIR=/var/log/postgresql \
    PG_CERTDIR=/etc/postgresql/certs \
    ORAFCE_VERSION=3_22_0

RUN yum  -y update \ 
 &&  yum -y install readline \
 &&  yum -y install readline-devel \
 &&  yum -y install zlib zlib-devel \
 &&  yum -y install flex bison \
 &&  yum -y install bison \
 &&  yum -y install gcc \
 &&  yum  -y install unzip \
 &&  yum  -y install wget \
 &&  yum  -y install make 

# explicitly set user/group IDs
RUN set -eux; \
	groupadd -r postgres ; \
# https://salsa.debian.org/postgresql/postgresql-common/blob/997d842ee744687d99a2b2d95c1083a2615c79e8/debian/postgresql-common.postinst#L32-35
	useradd -r -g postgres --home-dir=/var/lib/postgresql --shell=/bin/bash postgres; \
# also create the postgres user's home directory with appropriate permissions
# see https://github.com/docker-library/postgres/issues/274
	mkdir -p /var/lib/postgresql; \
	chown -R postgres:postgres /var/lib/postgresql
#

RUN cd /tmp \
&& wget https://ftp.postgresql.org/pub/source/v13.7/postgresql-13.7.tar.gz \ 
&& tar xvzf postgresql-13.7.tar.gz \
&& cd postgresql* \
&& ./configure --prefix=/var/lib/postgresql  \
&& make world \
&& make install world  \
&& cd  contrib \
&& make \
&& make install

ENV PATH $PATH:/var/lib/postgresql/bin
ENV PGDATA /var/lib/postgresql/data
 
RUN cd /tmp \ 
&&  wget  https://codeload.github.com/orafce/orafce/tar.gz/refs/tags/VERSION_${ORAFCE_VERSION} -O orafce.tar.gz \
&& tar xvzf orafce.tar.gz \
&& mv /tmp/orafce-VERSION_${ORAFCE_VERSION} /var/lib/postgresql/share/extension/ \
&& cd /var/lib/postgresql/share/extension/orafce-VERSION_${ORAFCE_VERSION} \
&& make \
&& make install 



COPY config/pldebugger-1.4.tar.gz /tmp/
RUN cd /tmp \
&& tar xvzf /tmp/pldebugger-1.4.tar.gz \ 
&& mv /tmp/pldebugger-1.4 /tmp/postgresql-13.7/contrib/ \
&& cd /tmp/postgresql-13.7/contrib/pldebugger-1.4 \
&& make \
&& make install 


RUN mkdir /pg_conf 
COPY 13/postgresql.conf /pg_conf/
COPY 13/pg_hba.conf /pg_conf/

RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
VOLUME /var/lib/postgresql/data

EXPOSE 5432

COPY 13/docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
 
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
 
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

