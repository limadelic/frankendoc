exports.passed = (step) -> new @Result step.title, 'passed'
exports.failed = (step, e) -> new @Result step.title, 'failed', e.message
exports.pending = (step, msg) -> new @Result step.title, 'pending', msg

class @Result

  constructor: (@step, @status, @message) ->
    @passed = @status is 'passed'
    @failed = @status is 'failed'
    @pending = @status is 'pending'
