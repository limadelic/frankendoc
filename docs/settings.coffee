@settings =
  
  docs:
    reader: 'github'
    repo: 'git://github.com/limadelic/frankendoc.wiki.git'
    type: '.md'
    code_block: /`{3}([\s\S]*?)`{3}/g
    multiline_arg: /^(\s{3}|"{3})$/
  code:
    root: 'docs/src'

