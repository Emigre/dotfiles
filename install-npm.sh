#!/bin/bash

# Add this to .npmrc:
# prefix=~/.node

sudo npm install npm -g

sudo chown -R $USER ~/.npm
sudo chown -R $USER ~/.node/lib/node_modules

npm install bower -g
npm install ember-cli -g
npm install generator-angular -g
npm install generator-gulp-angular -g
npm install generator-backbone -g
npm install generator-backbone-mocha -g
npm install generator-bootstrap -g
npm install generator-extjs@ -g
npm install generator-jekyllstarter -g
npm install generator-karma -g
npm install generator-mocha -g
npm install generator-webapp -g
npm install generator-magic -g
npm install generator-wizardry -g
npm install grunt-cli -g
npm install gulp -g
npm install karma-cli -g
npm install mocha -g
npm install npm-check-updates -g
npm install phantomjs -g
npm install yo -g
npm install less -g
npm install divshot-cli -g
npm install http-server -g
npm install cordova -g
npm install ionic -g
npm install n -g

sudo n 0.10.40
sudo n latest
