#!/bin/bash
set -e

echo "======== Starting pre-build script ========"
echo "Ruby version: $(ruby -v)"
echo "Bundler version: $(bundle -v)"
echo "RubyGems version: $(gem -v)"

echo "======== Removing dependency files ========"
rm -f Gemfile.lock
rm -rf .bundle
rm -rf vendor

echo "======== Setting up new clean Gemfile ========"
cat > Gemfile << 'EOL'
source 'https://rubygems.org'

# Basic Jekyll setup
gem "jekyll"
gem "webrick"  # Required for Ruby 3+

# Jekyll plugins
gem "jekyll-optional-front-matter"
gem "jekyll-default-layout"
gem "jekyll-readme-index"
gem "jekyll-titles-from-headings"
gem "jekyll-relative-links"
gem "jekyll-seo-tag"
gem "jekyll-feed"
gem "jekyll-last-modified-at"
gem "jekyll-redirect-from"
gem 'jekyll-wikilinks'

# Support gems
gem "kramdown-parser-gfm"
gem 'sassc'
EOL

echo "======== Pre-build setup completed ========"
echo "Contents of Gemfile:"
cat Gemfile 