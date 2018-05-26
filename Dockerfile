FROM alpine:3.7
LABEL maintainer="Maximilian Mayer <mayer.maximilian@googlemail.com>"
LABEL version="0.1.4"
LABEL description="hugo builder"
EXPOSE 1313

# Download and install hugo
ARG hugo_version=0.41
ENV HUGO_VERSION $hugo_version
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz  # fixed extension and arch
ENV HUGO_MODE server

WORKDIR /srv/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.tar.gz
COPY run.sh /srv/hugo/run.sh

RUN mkdir -p /opt/hugo && \
    tar -zx -C /opt/hugo -f /tmp/hugo.tar.gz && \
    ln -s /opt/hugo/hugo /usr/bin/
ADD hugo_src/ /srv/hugo/src


VOLUME /srv/hugo
#build
ENTRYPOINT ["./run.sh"]
