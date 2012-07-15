class Batchat.AppController extends Batman.Controller
  routingKey: 'app'

  index: ->
    Batchat.User.load (err,results) =>
      @set 'users', results
    Batchat.Message.load (err,results) =>
      @set 'messages', results