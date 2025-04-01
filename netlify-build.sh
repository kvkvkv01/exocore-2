#!/bin/bash
set -e

echo "Starting Netlify build process"

# Install Ruby if needed (as a fallback)
if ! command -v ruby &> /dev/null; then
  echo "Ruby not found, attempting to install..."
  apt-get update && apt-get install -y ruby-full build-essential
fi

# Install bundler if needed
if ! command -v bundle &> /dev/null; then
  echo "Bundler not found, installing..."
  gem install bundler -v 2.1.4
fi

# Display versions
echo "Ruby version:"
ruby -v
echo "Bundler version:"
bundle -v
echo "RubyGems version:"
gem -v

# Remove Gemfile.lock
echo "Removing Gemfile.lock"
rm -f Gemfile.lock

# Create a modified Gemfile to avoid ffi version issues
echo "Creating modified Gemfile..."
cat > Gemfile << EOL
source 'https://rubygems.org'

gem "jekyll", "4.2.1"
gem "jekyll-optional-front-matter"
gem "jekyll-default-layout"
gem "jekyll-readme-index"
gem "jekyll-titles-from-headings"
gem "jekyll-relative-links"
gem "kramdown-parser-gfm"
gem "kramdown"
gem "webrick"
gem "jekyll-seo-tag", "~> 2.0"
gem "html-proofer", "~> 3.0"
gem "rubocop", "~> 0.16", require: false
gem "w3c_validators", "~> 1.3"
gem "jekyll-last-modified-at"
gem "jekyll-redirect-from"
gem "jekyll-feed"
gem 'jekyll-wikilinks', '0.0.11'
gem "ruby-graphviz"
gem "jekyll-graph"
gem 'csv'
gem 'base64' 
gem 'bigdecimal'
gem 'sassc', '2.1.0'
gem 'ffi', '1.12.2'
EOL

# Install dependencies
echo "Installing dependencies"
bundle install

# Build the site
echo "Building Jekyll site"
bundle exec jekyll build 