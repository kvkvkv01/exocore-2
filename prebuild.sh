#!/bin/bash
set -e

echo "Removing Gemfile.lock..."
rm -f Gemfile.lock

echo "Setting up new clean Gemfile..."
cat > Gemfile << 'EOL'
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
EOL

echo "Pre-build setup completed" 