window.WordBump = class WordBump extends Batman.App
  #C:\zprojects\batmanjs-demos\001-local-wordbump\views\app\index.html
  Batman.ViewStore.prefix = 'zprojects/batmanjs-demos/001-local-wordbump/views'

  # loads up controllers & model
  @controller 'app'
  @model 'word'

  @root 'app#index'
  @route 'app', 'app#index'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "WordBump ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value