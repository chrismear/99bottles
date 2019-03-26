FROM ruby:2.6.2
WORKDIR /app
COPY Gemfile* ./
RUN bundle install