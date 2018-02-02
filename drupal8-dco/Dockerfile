FROM php:7.1-cli

MAINTAINER Andre Toledo Modesto de Souza <atoledo@ciandt.com>

RUN apt-get update

RUN apt-get -y --force-yes --no-install-recommends install \
  git zip unzip curl vim wget ssh rsync

# Composer
RUN curl -ksSL https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  chmod 777 /usr/local/bin/composer

ENV PATH="$PATH:/root/.composer/vendor/bin"

# PHP_CodeSniffer
RUN composer global require drupal/coder && \
  phpcs --config-set installed_paths /root/.composer/vendor/drupal/coder/coder_sniffer && \
  phpcs -i

# Drush
RUN composer global require symfony/yaml:~3
RUN composer global require drush/drush:dev-master

# Copy Acquia Drush alias integration
COPY config/.drush /root/.drush

# Cleanup
RUN apt-get purge -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y

#CMD phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md,js janrain
