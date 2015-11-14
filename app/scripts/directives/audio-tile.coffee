'use strict';

angular.module('polihymniaApp').directive('audioTile', ($interval) ->
  restrict: 'A'
  templateUrl: 'views/directives/audio-tile.html'
  scope: true
  link: (scope, element) ->

    scope.audioFiles = [
      {
        url: '1.mp3'
        title: 'Requiem d-moll'
        composer: 'Wolfgang Amadeusz Mozart'
      }
      {
        url: '1.mp3'
        title: 'Requiem d-moll'
        composer: 'Wolfgang Amadeusz Mozart'
      }
      {
        url: '1.mp3'
        title: 'Requiem d-moll'
        composer: 'Wolfgang Amadeusz Mozart'
      }
    ]

    sliderInterval = $interval(() ->
      if scope.sliderIndex < scope.audioFiles.length - 1
        scope.sliderIndex++
      else
        scope.sliderIndex = 0
    , 11000)

    scope.$on('$destroy', () ->
      $interval.cancel(sliderInterval)
    )

    scope.goNext = () ->
      if scope.sliderIndex < scope.audioFiles.length - 1
        scope.sliderIndex++

    scope.goPrev = () ->
      if scope.sliderIndex > 0
        scope.sliderIndex--

    return
)