describe 'Args', ->

  it 'simple func', -> test '''

    verify login:
      when an user logs in
      it should be greeted

    verify login

  '''

  it 'func with args', -> test '''

    verify that it shows @msg when @user logs in:
      when '@user' logs in
      it should say '@msg'

    verify that it shows 'Hello lizard king' when 'Jim' logs in

  '''

  it 'func with regex', -> test '''

    verify that when @user logs in, (she|he) is greeted:
      when '@user' logs in
      it should be greeted

    verify that when 'Pam' logs in, she is greeted
    verify that when 'Jim' logs in, he is greeted

  '''
