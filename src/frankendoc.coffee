require 'fibrous'
Fiber = require 'fibers'

class Frank

  constructor: ->
    require('./readers/settings').read()
    @runner = new (require('./runner/runner').Runner)
    @files = new (require('./readers/files').Files)
    @classes = new (require('./readers/classes').Classes)
    @report = new (require('./reports/' + settings.report).Report)

  read: ->
    @files.read()
    @classes.read @files.code

  run: ->
    @report.start()
    @read()

    for doc in @files.docs()
      if doc.is_suite
      then @report.suite doc
      else @run_doc doc

    @report.stop()

  run_doc: (doc) ->
    @report.running doc.name
    results = @runner.run_steps @classes.new(), doc.steps
    @report.finished results

@frank = -> Fiber(-> new Frank().run()).run()

