#syntax=docker/dockerfile:1
FROM frolvlad/alpine-ruby:latest

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# add a script to be executed every time the container starts:
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# Would the following value change for production Dockerfiles?
EXPOSE 3000

# configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]