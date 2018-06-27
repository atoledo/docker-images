# CLI Docker image for Drupal 8

Custom image for Drupal 8 / PHP development

Contains:
- PHP 7.1
- Drush ~8
- Drupal Console
- PHP_CodeSniffer
- Composer

Usage: The docker-entrypoint.sh script expects 2 environment parameters: CLI_USER_ID and CLI_USER_GROUP

To get these values run:

$ id -u

$ id -g

General usage:
docker run --name d8-cli --rm \
  -v /path/to/workspace:/workspace \
  -e CLI_USER_ID=123456789 \
  -e CLI_USER_GROUP=123456789 \
  -t bosolutions/d8-cli
