FROM ruby:3.2.0-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \    
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    nano \
    postgresql-client \    
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN gem install bundler

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle install
COPY . ./

#RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["sleep","infinity"]