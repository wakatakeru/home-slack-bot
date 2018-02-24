FROM ruby:latest

ADD client.rb /client.rb

WORKDIR /

CMD ruby client.rb