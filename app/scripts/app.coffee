'use strict';

app = angular.module('polihymniaApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
app.config(($routeProvider) ->
  $routeProvider.when('/', 
    templateUrl: 'views/main.html'
    controller: 'MainCtrl',
    controllerAs: 'main'
  ).when('/about', 
    templateUrl: 'views/about.html',
    controller: 'AboutCtrl',
    controllerAs: 'about'
  ).otherwise(
    redirectTo: '/'
  );
  return
)
