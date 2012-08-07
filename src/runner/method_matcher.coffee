class @MethodMatcher

  match: (@sut, @step) -> @literal() ? @regex()

  literal: -> @sut[@step] if @sut[@step]?

  regex: ->
    for method of @sut when @step.match new RegExp method, 'i'
      return @sut[method]
