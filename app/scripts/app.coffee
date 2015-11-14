'use strict';

app = angular.module('polihymniaApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'pascalprecht.translate',
    'angular-carousel'
  ])

app.config(($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'views/main.html'
    controller: 'MainCtrl'
    controllerAs: 'main'
  ).otherwise(
    redirectTo: '/'
  );
  return
)
