'use strict'

angular.module('polihymniaApp').directive('noHover', () ->
	restrict: 'A'
	link: (scope, element) ->

		element.bind('touchmove', () ->
			#element.addClass 'no-hover'
		)

)