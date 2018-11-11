# monaco-editor-sync

The [Monaco editor sources](https://github.com/Microsoft/monaco-editor) are actually comprised of a [chunk of source code inside VSCode](). They get [extracted by a script](https://github.com/Microsoft/vscode/blob/master/build/gulpfile.editor.js#L67) into an NPM package but there is no git repo of just the Monaco source. This makes it difficult for people to create Monaco forks or customisations, or even simply "use the source, Luke".

This repo is intended to hold a daily Travis CI job that:

- Clones https://github.com/benhutchison/monaco-editor-standlone and queries the latest commit on master
- Clones https://github.com/Microsoft/vscode/ and for each new commit on master, 
  - checks it out
  - runs Gulp task `extract-editor-src`
  - commits changes to repo `monaco-editor-standlone`
- Pushes `monaco-editor-standlone`

Many commits will be no-ops since not all changes in the source repo affect the monaco editor code.

The intent is to provide a dervived repo that can be forked & then customized. Of course, if you choose to fork you'll be accepting the ongoing maintenance of reconciling upstream changes with your modifications. But at least you'll have that choice.
