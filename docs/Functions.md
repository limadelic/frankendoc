SIMPLE FUNCTION
- notice the : ending the sentence
- the steps are indented
- and then it's called

= Example ==================

verify login:
  when an user logs in
  it should be greeted

verify login
____________________________


USING ARGS
- the args are words starting with @
- they are used in the steps with quotes
  because they are Steps Args

= Example =================================================

verify that it shows @msg when @user logs in:
  when '@user' logs in
  it should say '@msg'

verify that it shows 'Hello lizard king' when 'Jim' logs in
___________________________________________________________


ARGS & REGEXES
- it matches (she|he)

= Example ==========================================

verify that when @user logs in, (she|he) is greeted:
  when '@user' logs in
  it should be greeted

verify that when 'Pam' logs in, she is greeted
verify that when 'Jim' logs in, he is greeted
____________________________________________________
