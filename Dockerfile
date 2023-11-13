FROM ruby:3.2.2-alpine

WORKDIR /hello

COPY lib/hello/* /hello/

RUN apk update && \
apk add --no-cache build-base && \
bundle install

CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:4567"]

EXPOSE 4567
