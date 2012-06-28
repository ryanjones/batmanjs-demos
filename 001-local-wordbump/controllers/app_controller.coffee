class WordBump.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    @set 'wordOne', new Word (name: 'Ninja', rank: 0)
    @set 'wordTwo', new Word (name: 'Waffle', rank: 0)