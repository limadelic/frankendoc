class @MethodMatcher

  method_matched: (method, args = []) ->
    @step.args = args
    @step.args.push @step.multiline_arg if @step.multiline_arg?
    global.Sut = @sut
    return @sut[method]

  match: (@sut, @step) -> @literal() ? @regex()

  literal: -> @method_matched @step.name if @sut[@step.name]?

  regex: -> for method of @sut when (match = @step.name.match @matcher_for method)?
    return @method_matched method, match[1..]

  matcher_for: (method) ->
    method = method.replace /@\w+/g, '(.*)'
    new RegExp '^' + method + '$', 'i'
