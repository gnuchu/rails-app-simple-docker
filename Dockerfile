# FROM rails:onbuild
FROM ruby:2.3

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN gem install bundler && bundle install

COPY . /usr/src/app
ENV RAILS_VERSION 4.2.6

#RUN gem install bundle && bundle install
RUN gem install rails --version "$RAILS_VERSION"

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
