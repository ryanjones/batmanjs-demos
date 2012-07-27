class Batchat.User extends Batman.Model
  @resourceName: 'user'

  @persist Batman.RailsStorage
  @encode 'name', 'logged_in'

  @validate 'name', 'logged_in', presence: yes

  @hasMany 'messages'