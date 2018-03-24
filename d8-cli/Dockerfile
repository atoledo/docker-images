FROM php:7.1-cli

MAINTAINER Andre Toledo Modesto de Souza <atoledo@ciandt.com>

RUN apt-get update #redo

RUN apt-get -y --force-yes --no-install-recommends install \
  git zip unzip curl vim wget ssh rsync

# Adding PHP extensions.
RUN apt-get -y --force-yes --no-install-recommends install \
  libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev && \
  docker-php-ext-install -j$(nproc) iconv mcrypt && \
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&  \
  docker-php-ext-install -j$(nproc) gd && \
  docker-php-ext-install mysqli pdo pdo_mysql

# Create a non-root user with access to sudo and the default group set to 'users' (gid = 100)
RUN useradd -m -s /bin/bash -g users -G sudo,www-data,ssh -p docker docker && \
    echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Composer
RUN curl -ksSL https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  chmod 777 /usr/local/bin/composer

ENV PATH="$PATH:/root/.composer/vendor/bin"

# Drupal Console
RUN curl https://drupalconsole.com/installer -L -o drupal.phar && \
  php drupal.phar && \
  mv drupal.phar /usr/local/bin/drupal && \
  chmod +x /usr/local/bin/drupal

# PHP_CodeSniffer
RUN composer global require drupal/coder && \
  phpcs --config-set installed_paths /root/.composer/vendor/drupal/coder/coder_sniffer && \
  phpcs -i

# Drush
RUN composer global require symfony/yaml:~3
RUN composer global require drush/drush:~8

# Add MySQL client so Drush can perform db operations
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  mysql-server

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

# Cleanup
RUN apt-get purge -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y

ENTRYPOINT ["/bin/docker-entrypoint.sh"]

CMD [ "bash"]