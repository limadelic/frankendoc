exports.report = (@test, @results) ->
  errors = find_errors()
  if errors.length
  then failed errors
  else passed()

find_errors = -> result for result in @results when not result.passed

passed = -> console.log ' ✔ ' + @test

failed = (errors) ->
  console.log ' ✖ ' + @test
  for error in errors
    console.log '    ' + error.step + ': ' + error.message
