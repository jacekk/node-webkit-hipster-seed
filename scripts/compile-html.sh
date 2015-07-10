#!/bin/bash

node_modules/.bin/jade app/index.jade --pretty --out app/assets/
node_modules/.bin/jade app/templates/ --pretty --out app/assets/templates/

rm app/index.jade && rm -rf app/templates/
