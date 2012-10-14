@settings =
  docs:
    reader: 'github'
    repo: 'git://github.com/limadelic/frankendoc.wiki.git'
    type: '.md'
    code_block: /```([\s\S]*?)```/g
    multiline_arg: /^(\s\s\s|""")$/
  code:
    root: 'docs/src'
