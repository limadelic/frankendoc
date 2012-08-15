exports.passed = (step) -> new @Result step.name, 'passed'
exports.failed = (step, e) -> new @Result step.name, 'failed', e.message
exports.pending = (step, msg) -> new @Result step.name, 'pending', msg

class @Result

  constructor: (@step, @status, @message) ->
    @passed = @status is 'passed'
    @failed = @status is 'failed'
    @pending = @status is 'pending'
