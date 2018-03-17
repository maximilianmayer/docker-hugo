FROM alpine
LABEL maintainer="Maximilian Mayer <mayer.maximilian@googlemail.com>"
LABEL version="0.1.1"
LABEL description="hugo builder"
EXPOSE 1313

# Download and install hugo
ENV HUGO_VERSION 0.37.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz  # fixed extension and arch
ENV HUGO_MODE server

WORKDIR /srv/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.tar.gz
RUN mkdir -p /opt/hugo && \
    tar -zx -C /opt/hugo -f /tmp/hugo.tar.gz && \
    ls /opt/hugo

ADD hugo_src/ .
ADD run.sh run.sh
RUN ln -s /opt/hugo/hugo /usr/bin/

#build
CMD ["./run.sh"]
