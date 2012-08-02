class @MethodMatcher

  match: (@sut, @step) -> @literal() ? @regex()

  literal: -> @sut[@step] if @sut[@step]?

  regex: -> return @sut[method] for method of @sut when @step.match method
