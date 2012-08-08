# Steps Arguments

Args are single quoted tokens in a [Step](https://github.com/limadelic/contextual/blob/master/docs/Steps.md)  
They are replaced in the declaration by a **@x**  
And are passed in left to right order as a function argument  
They [Login](https://github.com/limadelic/contextual/blob/master/docs/src/login.coffee) class implements the following steps with arguments  

### Example
```
when 'Jim' logs in  
it should say 'Hello lizard king'  
```
