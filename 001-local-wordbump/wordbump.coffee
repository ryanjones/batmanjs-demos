window.WordBump = class WordBump extends Batman.App

  Batman.ViewStore.prefix = 'views'

  # loads up controllers & model
  @controller 'app'
  @model 'word'

  @root 'app#index'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "WordBump ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value