class WordBump.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    @set 'wordList', @fillWordList()

  bumpUpOne: ->
  	# increment the rank if the word is clicked
    @wordOne.set('rank', @wordOne.get('rank') + 1)

  bumpUpTwo: ->
  	# increment the rank if the word is clicked
    @wordTwo.set('rank', @wordTwo.get('rank') + 1)

  fillWordList: ->
    wordList = []
    words = ['waffle', 'batman', 'ninja', 'rock', 'paper', 'tree']
    
    # loop through all of the words creating word objects
    for word in words
      wordList.push new WordBump.Word(name: word, rank: 0)

    wordList
