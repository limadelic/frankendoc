describe 'Sentences', ->

  it 'says hello', -> test '''

    when an user logs in
    it should be greeted

  '''

  it "doesn't say wuzup", ->

    results = run('''

      when 'Jim' logs in
      it should say 'wuzup'

    ''')

    expect(results.length).toEqual 2

    failure = results[1]
    expect(failure.passed).toBeFalsy()
    expect(failure.message)
      .toEqual "expected 'wuzup' to equal 'Hello lizard king'"