FROM ruby:2.5
MAINTAINER Weslley de Sousa <weslleyocara@hotmail.com>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3 --fix-missing --no-install-recommends

#POSTGRESQL
#RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-10 --fix-missing --no-install-recommends
ENV INSTALL_PATH /thefarma
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile
ADD Gemfile* $INSTALL_PATH/
RUN bundle install
COPY . .

RUN rails RAILS_ENV=production assets:precompile
VOLUME ["$INSTALL_PATH/public"]
CMD puma -C config/puma.rb -e production