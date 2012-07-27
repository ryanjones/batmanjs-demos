class Batchat.Message extends Batman.Model
  @resourceName: 'message'
  @url = "/messages"

  @persist Batman.RailsStorage
  @encode 'content'

  @validate 'content', presence: yes

  @belongsTo 'user'
