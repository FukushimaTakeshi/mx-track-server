FROM ruby:3.0.0

WORKDIR /app

# Add packages
RUN apt-get update && apt-get install -y \
      git \
      nodejs \
      vim