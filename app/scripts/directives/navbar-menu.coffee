'use strict';

angular.module('polihymniaApp').directive('navbarMenu', ($window) ->
  restrict: 'EA'
  transclude: true
  templateUrl: 'views/partials/navbar-menu.html'
  link: (scope, element) ->
    resizeHandler = ->
      navbarMargin = (element.parent().parent()[0].offsetWidth - 16 - element.width()) / 2
      element.css(
        right: navbarMargin
      )
      return
    resizeHandler()
    angular.element($window).bind 'resize', ->
      resizeHandler()
      return
    return
)