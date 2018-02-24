FROM ruby:latest

ADD client.rb /client.rb

RUN ruby /client.rb