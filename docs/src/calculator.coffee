require 'csharp.js'
using 'Math.Calculator'

class @CalculatorFixture

  constructor: ->
    @calculator = new Calculator

  '@x plus @y = @result': (x, y, result) ->
    @calculator.Add(x, y).should.eql Number result

  '@x minus @y = @result': (x, y, result) ->
    @calculator.Subtract(x, y).should.eql Number result