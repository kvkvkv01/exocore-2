---
published: true
subtitle:
topic: meta
date: 2025-01-20
tags: exocore
foam_template:
  filepath: '_articles/configure-exocore-for-personal-use.md'
  name: Article
---

# Configure Exocore for Personal Use

## Change your Username and Homepage

Navigate to `/exocore/data/user.yml`. Open the file in any text-editor (e.g. [Notepad](https://en.wikipedia.org/wiki/Notepad%2B) or [TextEdit](https://en.wikipedia.org/wiki/TextEdit)) and look for `user_name: Anon`. Change this to whatever name you want to appear on the left sidebar.

## Change your Homepage Content

In the same `/exocore/data/user.yml` file, you will also see `welcome_header` and `welcome_subtitle`. These control the title and subtitle that appear on your homepage.

On the root folder you will find `index.md`, this can be edited like any other article as your homepage with the addition of the title and header from the `user.yml` file. Make sure you keep the following frontmatter at the top of the markdown file:

``` yml
---
layout: home
title: home
---
```

## Change your Profile Picture

The profile picture that appears on the left sidebar is located at `assets/img/pfp.png`, you can replace this file with any .png. Note that it will be resized into a square.

## Change your Site's Title and URL

Navigate to ```/_config.yml``` to change the Title and URL of your exocore. All other settings can be left as is.

## Change the Theme

The Exocore ships with a single minimalist black and white theme to function as a blank canvas for you to adapt.

## Building locally

Tbh that took me a while, but I got it. Use [rvm](https://en.wikipedia.org/wiki/Ruby_Version_Manager) or (uru if you're on windows) to install Ruby 2.7, run `gem install bundler`, `bundle install` and, if everything goes well, run `bundle exec jekyll serve`. Your site should be up.

## Hosting

Just use netlify.

---

Move on to [[Using your Exocore]] for further guidance.
