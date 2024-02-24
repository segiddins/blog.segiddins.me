FROM ruby:2.4.10-alpine

RUN \
  --mount=type=cache,id=dev-apk-cache,sharing=locked,target=/var/cache/apk \
  --mount=type=cache,id=dev-apk-lib,sharing=locked,target=/var/lib/apk \
  apk add \
  ca-certificates \
  build-base \
  bash \
  zstd-libs \
  linux-headers \
  zlib-dev \
  git \
  nodejs \
  tzdata

RUN gem update --system=3.3.27
ENV GEM_REQUIREMENT_BUNDLER=1.17.3
ENV BUNDLER_VERSION=1.17.3

RUN mkdir -p /site

WORKDIR /site

# Install application gems
COPY Gemfile* /site/
RUN --mount=type=cache,id=bld-gem-cache,sharing=locked,target=/srv/vendor \
  gem install bundler:${BUNDLER_VERSION} && \
  bundle config --local without 'development test' && \
  bundle config --local path /srv/vendor && \
  bundle install --jobs 20 --retry 5 && \
  bundle clean && \
  mkdir -p /gems/vendor && \
  bundle config --local path /gems/vendor && \
  cp -ar /srv/vendor /gems/ && \
  rm -fr /gems/vendor/ruby/*/cache

RUN git config --global user.email "segiddins@segiddins.me" && \
  git config --global user.name "Samuel Giddins"

# ENTRYPOINT ["bundle", "exec"]
CMD ["bundle", "exec","rake", "deploy"]
