FROM alpine

RUN apk update && apk add git wget mysql-client bash coreutils m4 make gcc musl-dev
RUN apk add python3 && wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && ln -s /usr/bin/python3 /usr/bin/python

COPY . bld

RUN git clone https://github.com/Joeasaurus/cpfb.git cb \
	&& cp bld/backupld /usr/bin/ \
	&& cp cb/cpfb /usr/bin/ \
	&& chmod +x /usr/bin/*

RUN mkdir -p /opt/backups

ENTRYPOINT ["/bin/bash", "/usr/bin/backupld"]
CMD ["/etc/backupld.conf"]
