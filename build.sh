#!/bin/bash
set -e

# Remove Gemfile.lock if it exists
rm -f Gemfile.lock

# Install dependencies with specific version
bundle install

# Build the site
bundle exec jekyll build 