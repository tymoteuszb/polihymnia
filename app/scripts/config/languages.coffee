app.config(($translateProvider) ->
  $translateProvider.useStaticFilesLoader(
    prefix: 'languages/'
    suffix: '.json'
  )

  $translateProvider.preferredLanguage 'pl'
  $translateProvider.fallbackLanguage 'pl'
)