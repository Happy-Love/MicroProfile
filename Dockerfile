FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json . 
COPY yarn.lock .
RUN bundle check || bundle install
COPY . /myapp
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# Проброс порта     
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]