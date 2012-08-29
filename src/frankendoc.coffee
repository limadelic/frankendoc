require 'fibrous'
Fiber = require 'fibers'

class Frank

  constructor: ->
    require('./readers/settings').read()
    @docs = require('./readers/' + settings.docs.reader).read()
    @code = require('./readers/' + settings.code.reader).read()
    @runner = new (require('./runner/runner').Runner)
    @report = new (require('./reports/' + settings.report).Report)

  run: ->
    @report.start()
    @run_docs()
    @report.stop()

  run_docs: -> for doc in @docs
    if doc.is_suite
    then @report.suite doc
    else @run_doc doc

  run_doc: (doc) ->
    @report.running doc.name
    @report.finished @run_steps doc.steps

  run_steps: (steps) -> @runner.run_steps @code.new(), steps

@frank = -> Fiber(-> new Frank().run()).run()

