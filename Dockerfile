FROM ruby:2.3.0

WORKDIR /opt
RUN apt-get update -qq
RUN apt-get install -qq -y libv8-dev nginx
ADD Gemfile /opt/Gemfile
ADD Gemfile.lock /opt/Gemfile.lock
RUN bundle install --path vendor/bundle --deployment --without development test
ADD . /opt
RUN bundle exec rake assets:precompile

CMD bundle exec rails s -e production -b 0.0.0.0
EXPOSE 3000
