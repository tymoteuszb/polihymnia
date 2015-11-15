'use strict';

angular.module('polihymniaApp').directive('galleryTile', ($interval) ->
  restrict: 'A'
  templateUrl: 'views/directives/gallery-tile.html'
  scope: true
  link: (scope, element) ->

    scope.galleryImages = [
      { url: '1.png' }
      { url: '1.png' }
      { url: '1.png' }
    ]

    sliderInterval = $interval(() ->
      if scope.sliderIndex < scope.galleryImages.length - 1
        scope.sliderIndex++
      else
        scope.sliderIndex = 0
      return
    , 9000)

    scope.$on('$destroy', () ->
      $interval.cancel(sliderInterval)
    )

    clearAndSet = () ->
      $interval.cancel(sliderInterval)
      sliderInterval = $interval(() ->
        if scope.sliderIndex < scope.galleryImages.length - 1
          scope.sliderIndex++
        else
          scope.sliderIndex = 0
        return
      , 9000)
      return

    scope.goNext = () ->
      if scope.sliderIndex < scope.galleryImages.length - 1
        scope.sliderIndex++
        clearAndSet()

    scope.goPrev = () ->
      if scope.sliderIndex > 0
        scope.sliderIndex--
        clearAndSet()

    return
)