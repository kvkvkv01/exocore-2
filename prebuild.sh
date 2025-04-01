#!/bin/bash
set -e

echo "Removing dependency files..."
rm -f Gemfile.lock
rm -rf .bundle
rm -rf vendor

echo "Resetting bundler configuration..."
bundle config --delete path || true
bundle config --delete without || true
bundle config --local system true

echo "Setting up new clean Gemfile with NO version constraints..."
cat > Gemfile << 'EOL'
source 'https://rubygems.org'

gem "jekyll"
gem "jekyll-optional-front-matter"
gem "jekyll-default-layout"
gem "jekyll-readme-index"
gem "jekyll-titles-from-headings"
gem "jekyll-relative-links"
gem "kramdown-parser-gfm"
gem "kramdown"
gem "webrick"
gem "jekyll-seo-tag"
gem "html-proofer"
gem "rubocop", require: false
gem "w3c_validators"
gem "jekyll-last-modified-at"
gem "jekyll-redirect-from"
gem "jekyll-feed"
gem 'jekyll-wikilinks'
gem "ruby-graphviz"
gem "jekyll-graph"
gem 'csv'
gem 'base64'
gem 'bigdecimal'
gem 'sassc'
EOL

echo "Pre-build setup completed" 