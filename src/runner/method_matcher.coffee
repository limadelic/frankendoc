class @MethodMatcher

  match: (@sut, @step) -> @literal() ? @regex()

  literal: -> @sut[@step.name] if @sut[@step]?

  regex: ->
    for method of @sut 
      match = @step.name.match new RegExp method, 'i'
      if match?
        @step.args = match[1..]
        return @sut[method]
