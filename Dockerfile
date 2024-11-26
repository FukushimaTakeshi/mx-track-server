FROM ruby:3.3.6

WORKDIR /app

# Add packages
RUN apt-get update && apt-get install -y \
      git \
      nodejs \
      vim
