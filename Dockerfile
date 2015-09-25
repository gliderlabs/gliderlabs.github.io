FROM gliderlabs/alpine:3.2
WORKDIR /usr/src/app
RUN apk -U add ruby ruby-bundler ruby-io-console nodejs tzdata
COPY bundler_config /root/.bundle/config
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN apk add -t build \
    ruby-dev \
    build-base \
    libxml2-dev \
    libxslt-dev \
    libffi-dev \
  && bundle install \
  && apk del --purge build \
  && rm -rf /var/cache/apk
COPY . /usr/src/app
