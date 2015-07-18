node_modules/.bin/jade app/index.jade --pretty --out app/assets/
node_modules/.bin/jade app/templates/ --pretty --out app/assets/templates/

del app/index.jade 
rd /s /q app/templates/
