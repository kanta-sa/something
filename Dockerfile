FROM ruby:2.5.8

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
                       libpq-dev \
                       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /something

ENV APP_PORT /something
WORKDIR $APP_PORT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler && bundle install
ADD . $APP_ROOT