FROM ruby:3.0.5-alpine3.16

RUN apk --no-cache add \
  build-base \
  make \
  g++ \
  sqlite-dev \
  bash \
  tzdata \
  nodejs \
  yarn \
  libx11-dev

WORKDIR /app
COPY Gemfile* ./
RUN bundle config set force_ruby_platform true
RUN bundle install -j4

RUN yarn

CMD sh -c "rails s -b 0.0.0.0"
