'use strict';

angular.module('polihymniaApp').directive('navbarMenu', () ->
  restrict: 'EA'
  transclude: true
  templateUrl: 'views/partials/navbar-menu.html'
  link: (scope, element, attrs) ->
    navbarMargin = (attrs.barWidth - element.width()) / 2
    element.css(
      right: navbarMargin
    )
    return
)