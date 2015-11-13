'use strict';

angular.module('polihymniaApp').directive('mainHeader', ($window, $translate) ->
  restrict: 'EA'
  transclude: true
  templateUrl: 'views/partials/main-header.html'
  link: (scope, element) ->

    element.css(
      top: 0
    )

    scope.headerScrolled = 0

    scope.availableLangs = [
      { code: 'pl', active: true }
      { code: 'en', active: false }
      { code: 'de', active: false }
      { code: 'fr', active: false }
    ]

    angular.element($window).bind('scroll', () ->
      headerScrolled = if this.pageYOffset <= 120 then this.pageYOffset else 120
      scope.headerScrolled = headerScrolled
      element.css(
        top: "#{-headerScrolled}px"
      )
      scope.$apply()
      return
    )

    scope.chooseActiveLang = (lang) ->
      $translate.use lang.code
      scope.availableLangs.forEach((elem) ->
        elem.active = if elem is lang then true else false
        return
      )
      return

    return
)