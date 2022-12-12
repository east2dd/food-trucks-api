FROM ruby:3.1.3-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app
COPY Gemfile* ./

ENV BUNDLE_PATH /gems
RUN gem update --system && gem install bundler && bundle install

COPY . /app/
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

EXPOSE 3000
