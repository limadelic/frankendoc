class @Classes

  load_from: (files) ->
    @classes = []
    @find_classes files

  find_classes: (files) ->
    for file in files
      module = require file
      for symbol of module when @is_class symbol
        @classes.push module[symbol]

  is_class: (symbol) -> symbol.match /^[A-Z]/

  new_instances: -> new clazz for clazz in @classes
