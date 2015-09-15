#!/bin/bash

# Add this to .npmrc:
# prefix=~/.node

sudo npm install npm -g

sudo chown -R $USER ~/.npm
sudo chown -R $USER ~/.node/lib/node_modules
sudo chown -R $USER ~/.node/bin

npm install bower -g
npm install broccoli-cli -g
npm install cordova -g
npm install divshot-cli -g
npm install ember-cli -g
npm install generator-angular -g
npm install generator-backbone -g
npm install generator-backbone-mocha -g
npm install generator-bootstrap -g
npm install generator-extjs@ -g
npm install generator-gulp-angular -g
npm install generator-jekyllstarter -g
npm install generator-aurelia -g
npm install generator-karma -g
npm install generator-magic -g
npm install generator-mocha -g
npm install generator-webapp -g
npm install generator-wizardry -g
npm install grunt-cli -g
npm install gulp -g
npm install http-server -g
npm install jspm@beta -g
npm install karma-cli -g
npm install less -g
npm install mocha -g
npm install n -g
npm install npm-check-updates -g
npm install phantomjs -g
npm install tsd -g
npm install typescript -g
npm install yo -g

sudo n latest
sudo n 0.10.40
sudo n 0.12.5
