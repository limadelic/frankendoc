# Running Confluence Pages

The goal of Frankendoc is to execute any type of document  
That includes docs in wikis  
Confluence is the first target wiki  
As more wikis are added some general solution should appear  
But lets KISS it for now  

# User Settings

Confluence needs some settings  
Some approach like [mocha.opts](http://visionmedia.github.com/mocha/) sounds attractive  
But in the name of laziness lets just add a [settings](https://github.com/limadelic/frankendoc/blob/master/docs/confluence/settings.coffee) file to the root folder  

# Running the Docs

Now we just need to point frank to the desired folder

**Example** [ [Run](https://github.com/limadelic/frankendoc/blob/master/docs/src/run.coffee) ]
```
> frank docs\confluence
```
