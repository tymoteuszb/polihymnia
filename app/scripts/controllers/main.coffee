'use strict';

angular.module('polihymniaApp').controller('MainCtrl', ($scope, $interval) ->

	$scope.blurActiveElements = () ->
		$scope.$broadcast 'elements:blur'
		
	return
)