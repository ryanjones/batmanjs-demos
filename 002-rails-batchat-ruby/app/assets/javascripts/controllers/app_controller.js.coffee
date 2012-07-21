class Batchat.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    # grab the last group of messages
    @populate()
    # create a new message so the user can punch it in
    @set 'newMessage', new Batchat.Message()

  createMessage: ->
    # save the users message in the DB
    @get('newMessage').save (err, message) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        # create a new empty message
        @set 'newMessage', new Batchat.Message()
        # force a refresh because we know we just added a new message
        @addNewMessages()

  populate: ->
    # populate the initial list of messages
    Batchat.User.load (err,results) =>
      @set 'users', new Batman.Set(results...)
    Batchat.Message.load (err,results) =>
      @set 'messages', new Batman.Set(results...)

  addNewMessages: ->
    # append new messages into the DOM
    Batchat.Message.load (err,results) =>
      newMessages = new Batman.Set(results...)
      existingMessages = @get('messages')

      # loop through to see if we have any new messages
      newMessages.forEach (x) ->
        # if the new message isn't found, add it to the existingMessages
        if !existingMessages.has(x)
          existingMessages.add(x)