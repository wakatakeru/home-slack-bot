FROM ruby:latest

ENV APP_ROOT /usr/src/home-slack-bot

WORKDIR $APP_ROOT

ADD Gemfile Gemfile
ADD client.rb client.rb

RUN bundle install
CMD bundle exec ruby client.rb