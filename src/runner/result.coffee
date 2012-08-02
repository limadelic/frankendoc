class @Result

  passed: (step)  ->
    step: step.title
    passed: true

  failed: (step, e) ->
    step: step.title
    passed: false
    message: e.message

  missing: (step) ->
    step: step.title
    passed: undefined