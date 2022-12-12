FROM ruby:3.0.3-slim

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
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
