class Batchat.Helper
  @Scroll:
    down: ->
      messages = $('.messages')
      messages.scrollTop(messages.get(0).scrollHeight);

