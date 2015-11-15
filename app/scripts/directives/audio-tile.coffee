'use strict';

angular.module('polihymniaApp').directive('audioTile', ($timeout, angularPlayer, $filter) ->
  restrict: 'A'
  templateUrl: 'views/directives/audio-tile.html'
  scope: true
  link: (scope, element) ->

    audioFiles = [
      {
        id: '0'
        url: 'http://www.schillmania.com/projects/soundmanager2/demo/_mp3/rain.mp3'
        title: 'Requiem d-moll'
        artist: 'Wolfgang Amadeusz Mozart'
      }
      {
        id: '1'
        url: 'http://www.schillmania.com/projects/soundmanager2/demo/_mp3/walking.mp3'
        title: 'Requiem d-moll'
        artist: 'Wolfgang Amadeusz Mozart'
      }
      {
        id: '2'
        url: 'http://www.schillmania.com/projects/soundmanager2/demo/_mp3/walking.mp3'
        title: 'Requiem d-moll'
        artist: 'Wolfgang Amadeusz Mozart'
      }
    ]

    sliderTimeout = null
    sliderTimeoutInterval = 11

    setSliderTimeout = () ->
      if sliderTimeout? then cancelSliderTimeout()
      sliderTimeout = $timeout(() ->
        if scope.sliderIndex < audioFiles.length - 1
          scope.sliderIndex++
        else
          scope.sliderIndex = 0
        return
      , sliderTimeoutInterval*1000)

    cancelSliderTimeout = () ->
      $timeout.cancel(sliderTimeout)

    setSliderTimeout()

    scope.$on('$destroy', () ->
      cancelSliderTimeout()
    )

    scope.goNext = () ->
      if scope.sliderIndex < audioFiles.length - 1
        scope.sliderIndex++
        clearAndSet()

    scope.goPrev = () ->
      if scope.sliderIndex > 0
        scope.sliderIndex--
        clearAndSet()

    angularPlayer.init()

    scope.$watch('sliderIndex', (val) ->
      if val is undefined
        return
      angularPlayer.stop()
      angularPlayer.setCurrentTrack(null)
      angularPlayer.clearPlaylist(() ->
        return
      )
      angularPlayer.addTrack(audioFiles[val])
      setSliderTimeout()
    )

    scope.playlist = audioFiles

    scope.playPause = () ->
      if angularPlayer.isPlayingStatus() then angularPlayer.pause() else angularPlayer.play()

    scope.$on('track:progress', (event, data) ->
      $timeout(() ->
        scope.progress = data
        return
      )
      return
    )

    scope.$on('currentTrack:position', (event, data) ->
      $timeout(() ->
        scope.currentPostion = $filter('humanTime')(data)
        return
      )
      return
    )

    scope.$on('currentTrack:duration', (event, data) ->
      $timeout(() ->
        scope.currentDuration = $filter('humanTime')(data)
        return
      )
      return
    )

    scope.$on('track:id', () ->
      cancelSliderTimeout()
    )

    scope.isPlaying = false;
    scope.$on('music:isPlaying', (event, data) ->
      $timeout(() ->
        scope.isPlaying = data
      )
    )

    return
)