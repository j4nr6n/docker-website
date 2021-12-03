#!/bin/sh

bin/console lint:container
bin/console lint:twig templates
bin/console lint:yaml config
vendor/bin/phpcs
vendor/bin/psalm --no-cache
bin/phpunit
