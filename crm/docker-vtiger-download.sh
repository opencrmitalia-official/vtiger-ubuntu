#!/usr/bin/env bash
set -e

rm /var/www/html/index.html

curl -o /tmp/7.1.0.tar.gz -L https://github.com/javanile/vtiger-core/archive/refs/tags/7.1.0.tar.gz

tar -xzf /tmp/7.1.0.tar.gz -C /tmp/
cp -r /tmp/vtiger-core-7.1.0/* /var/www/html

rm /tmp/7.1.0.tar.gz
rm -rf /tmp/vtiger-core-7.1.0