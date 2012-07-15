class Batchat.User extends Batman.Model
  @resourceName: 'user'

  @persist Batman.RailsStorage
  @encode 'name'

  @validate 'name', presence: yes
