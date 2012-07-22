class Batchat.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    # grab the last group of messages
    @populate()
    # create a new message so the user can punch it in
    @set 'newMessage', new Batchat.Message()

    # create a new user and save it
    @set 'user', new Batchat.User({name:Math.ceil(Math.random()*100000), logged_in: true})
    @get('user').save()

    # since we just joined we can fire a user refresh (we know there's a new user)
    @cleanUpUsers()


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

  cleanUpUsers: ->
    # keep updating the logged in flag so it shows we're logged in
    @get('user').updateAttributes().save()

    # append new users into the DOM
    Batchat.User.load (err,results) =>
      newUsers = new Batman.Set(results...)
      existingUsers = @get('users')

      # loop through to see if we have any new users
      newUsers.forEach (x) ->
        # if the new user isn't found, add it to the existingUsers
        if !existingUsers.has(x)
          existingUsers.add(x)

      # loop through to see if we need to remove anyone
      existingUsers.forEach (x) ->
        # if a user isn't in the new user list, remove them
        if !newUsers.has(x)
          existingUsers.remove(x)