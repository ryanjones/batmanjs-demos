class WordBump.Word extends Batman.Model
  @resourceName: 'word'
  @persist Batman.LocalStorage
  @encode 'name', 'rank'