class WordBump.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    # fill the initial wordlist
    @set 'wordList', @fillWordList()

    # setup the first 2 words
    @setInitialWords()

  fillWordList: ->
    wordList = new Batman.Set
    words = ['waffle', 'batman', 'ninja', 'rock', 'paper', 'tree', 'fight', 'small', 'yellow', 'blue']
    
    # loop through all of the words creating word objects
    for word in words
      wordList.add new WordBump.Word(name: word, rank: 0)

    wordList

  setInitialWords: ->
    # set the words
    @set 'wordOne', @get('wordList').toArray()[Math.floor((Math.random()*10))]
    @set 'wordTwo', @get('wordList').toArray()[Math.floor((Math.random()*10))]


  #### events

  bumpUpOne: ->
    # increment the rank if the word is clicked
    @wordOne.set('rank', @wordOne.get('rank') + 1)

    # change word two since word one is better
    @set 'wordTwo', @get('wordList').toArray()[Math.floor((Math.random()*10))]

  bumpUpTwo: ->
    # increment the rank if the word is clicked
    @wordTwo.set('rank', @wordTwo.get('rank') + 1)

    # change word one since word two is better
    @set 'wordOne', @get('wordList').toArray()[Math.floor((Math.random()*10))]