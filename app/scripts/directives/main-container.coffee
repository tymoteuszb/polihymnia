'use strict';

angular.module('polihymniaApp').directive('mainContainer', () ->
	restrict: 'EA'
	transclude: true
	templateUrl: 'views/partials/main-container.html'
)