#!/bin/bash
set -e

echo "Starting Netlify build process"

# Display Ruby and environment information
echo "Ruby version:"
ruby -v
echo "Bundler version:"
bundle -v
echo "RubyGems version:"
gem -v

# Remove Gemfile.lock to start fresh
echo "Removing Gemfile.lock"
rm -f Gemfile.lock

# Create a temporary Gemfile without problematic dependencies
echo "Creating temporary Gemfile"
grep -v "ffi" Gemfile > Gemfile.temp
mv Gemfile.temp Gemfile

# Install dependencies
echo "Installing dependencies"
bundle install

# Build the site
echo "Building Jekyll site"
JEKYLL_ENV=production bundle exec jekyll build 