class @Classes

  read: (files) ->
    @classes = []
    for file in files
      module = require file
      for symbol of module when @is_class symbol
        @classes.push module[symbol]

  is_class: (symbol) -> symbol.match /^[A-Z]/

  new: -> new clazz for clazz in @classes
