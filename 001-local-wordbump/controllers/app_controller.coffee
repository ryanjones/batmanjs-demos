class WordBump.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    @set 'wordOne', new WordBump.Word (name: 'Ninja', rank: 0)
    @set 'wordTwo', new WordBump.Word (name: 'Waffle', rank: 0)