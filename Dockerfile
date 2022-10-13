#syntax=docker/dockerfile:1
FROM ruby:2.7.0

RUN apt update && apt install -y \
	build-essential \
	libpq-dev \
	nodejs

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

# add a script to be executed every time the container starts:
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# Would the following value change for production Dockerfiles?
EXPOSE 3000

# configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]