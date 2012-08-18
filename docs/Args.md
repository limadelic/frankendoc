# Steps Arguments

Args are represented as matching groups in the [Step](https://github.com/limadelic/contextual/blob/master/docs/Steps.md) regex declaration  
For simplicity they could be represented as **@any_word** which will be translated to **(.*)**  
But that does not imply a relationship with the function parameters  
Their values are passed in left to right order to the function

**Example** [ [Login](https://github.com/limadelic/contextual/blob/master/docs/src/login.coffee) ]
```
when Jim logs in  
it should say Hello lizard king  
```

# Multiline Arguments

Enclose multiline args between """  
The quotes should be in a single line starting after the step  
There's no need to match the arg in the regex  
It will be passed as the last parameter

**Example** [ [Login](https://github.com/limadelic/contextual/blob/master/docs/src/login.coffee) ]
```
when Pam logs in  
it should say  
"""  
Hello turkey murderer  
"""  
```
