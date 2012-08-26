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

  run:->
    @report.start()
    @read()

    for doc in @files.docs
      @report.running doc.name
      results = @runner.run_steps @classes.new(), doc.steps
      @report.finished results

    @report.stop()

@frank = -> Fiber(-> new Frank().run()).run()

