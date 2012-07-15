class Batchat.Message extends Batman.Model
  @resourceName: 'message'

  @persist Batman.RailsStorage
  @encode 'content'

  @validate 'content', presence: yes
