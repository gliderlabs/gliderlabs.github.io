FROM alpine
ENV HUGO_RELEASE https://github.com/spf13/hugo/releases/download/v0.16/hugo_0.16_linux-64bit.tgz
RUN apk add --update git openssh bash curl
RUN curl -Ls $HUGO_RELEASE | tar -zxC /bin
COPY ./deploy /bin/deploy
WORKDIR /deploy
ENTRYPOINT ["/bin/deploy"]
