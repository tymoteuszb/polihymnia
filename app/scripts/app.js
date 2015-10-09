(function() {
  'use strict';
  var app;

  app = angular.module('polihymniaApp', ['ngAnimate', 'ngCookies', 'ngResource', 'ngRoute', 'ngSanitize', 'ngTouch']);

  app.config(function($routeProvider) {
    $routeProvider.when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      controllerAs: 'main'
    }).when('/about', {
      templateUrl: 'views/about.html',
      controller: 'AboutCtrl',
      controllerAs: 'about'
    }).otherwise({
      redirectTo: '/'
    });
  });

}).call(this);
