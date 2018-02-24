FROM ruby:latest

ENV APP_ROOT /usr/src/home-slack-bot

WORKDIR $APP_ROOT

ADD Gemfile Gemfile
ADD app app
ADD config config

RUN bundle install

CMD bundle exec ruby config/initializer.rb && bundle exec ruby app/client.rb