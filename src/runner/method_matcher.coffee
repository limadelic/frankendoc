class @MethodMatcher

  match: (@sut, @step) -> @literal() ? @regex()

  literal: -> @sut[@step.name] if @sut[@step]?

  regex: ->
    for method of @sut 
      match = @step.name.match @matcher_for method
      if match?
        @step.args = match[1..]
        return @sut[method]

  matcher_for: (method) ->
    method = method.replace /@\w+/g, '(.*)'
    new RegExp '^' + method + '$', 'i'
