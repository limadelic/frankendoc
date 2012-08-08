# Async Code

Every [Step](https://github.com/limadelic/frankendoc/blob/master/docs/Steps.md) is executed secuentially  
When executing async code, a callback is needed to signal that the step is done
Add an extra arg to those steps and a callback will be provided

**Example** [ [Files](https://github.com/limadelic/frankendoc/blob/master/docs/src/files.coffee) ]
```
Read any file  
Verify 'docs\async.md' contains 'Async Code'  
```



