jQuery ->
  # fire up the app
  Batchat.run()

  # there are much better solutions for these loops (long polling, SSE, etc.)
  # but this works. messages are of a higher priority (2s vs 10s for users).

  # start looping and checking for new messages
  setInterval( ->
    # add any new messages that people have sent
    Batchat.get('controllers.app').addNewMessages()
    # move the window down
    Batchat.Helper.Scroll.down()
  , 2000)

  # check if users have left, or joined (and clean up appropriately)
  setInterval( ->
    # clean up the users
    Batchat.get('controllers.app').cleanUpUsers()
    # move the window down
    Batchat.Helper.Scroll.down()
  , 10000)