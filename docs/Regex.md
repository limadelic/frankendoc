# Regular Expressions

Regexes can be used inside an [Step](https://github.com/limadelic/contextual/blob/master/docs/Steps.md) declaration  
They allow to tie grammatical variations to the same step  


**Example** [ [Login](https://github.com/limadelic/contextual/blob/master/docs/src/login.coffee) ]
```
when she logs in
it should greet her

when 'Jim' logs in
it should greet him
```
