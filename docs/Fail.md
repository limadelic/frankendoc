# Failing Steps

An [Step](https://github.com/limadelic/contextual/blob/master/docs/Steps.md) fails when an exception occurs during its execution
The most standard way would be having an assertion that fails
When a step fails the document is reported in red
And the error message is included in the output

**Example** [ [Login](https://github.com/limadelic/contextual/blob/master/docs/src/login.coffee) ]
```
When 'Jim' logs in  
it should say 'wuzup'  
```
