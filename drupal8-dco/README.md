# CLI Docker image for Drupal 8

Based on Debian 7.0 "Wheezy" (debian:wheezy)

## Includes

- php
  - php-fpm && php-cli 5.6.x
  - composer 1.0-dev
  - drush 6,7,8
    - registry_rebuild
    - coder-8.x + phpcs
  - drupal console 0.9.7
- ruby
  - ruby 1.9.3
  - gem 1.8.23
  - bundler 1.10.6
- nodejs
  - nvm 0.29.0
  - nodejs 4.2.2 (via nvm)
    - npm 3.4.0
    - bower 1.6.5
- python 2.7.3

Other notable tools:

- git
- curl/wget
- zip/unzip
- mysql-client
- imagemagick
- ping
- mc
