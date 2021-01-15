FROM ruby:2.7-alpine


RUN gem install bundler -v "~>1.0"
RUN apk add --no-cache build-base gcc bash cmake git

COPY ./Gemfile /jgt/Gemfile
COPY ./Gemfile.lock /jgt/Gemfile.lock

WORKDIR /jgt

RUN gem install bundler jekyll
RUN bundle

COPY . /jgt

EXPOSE 4000
ENTRYPOINT jekyll serve --livereload --host 0.0.0.0