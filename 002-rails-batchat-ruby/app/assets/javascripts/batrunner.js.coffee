jQuery ->
  # fire up the app
  Batchat.run()

  # start looping and checking for new messages
  # there are much better solutions for this (long polling, SSE, etc.)
  setInterval( ->
    Batchat.get('controllers.app').addNewMessages()
  , 2000)
