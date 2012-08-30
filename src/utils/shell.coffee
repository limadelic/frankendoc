p = require 'child_process'

@$ = (command) -> p.sync.exec command
