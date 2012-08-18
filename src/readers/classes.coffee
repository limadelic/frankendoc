class @Classes

  read: (files) ->
    @classes = []
    @names = []
    for file in files
      module = require file
      for symbol of module when @is_class symbol
        @classes.push module[symbol]
        @names.push symbol

  is_class: (symbol) -> symbol.match /^[A-Z]/

  new: ->
    global.Sut = {}
    for clazz in @classes
      global[clazz.name] = new clazz
    @names
