# gotoctags - Jump to function in micro editor

(forked from https://github.com/terokarvinen/micro-jump (MIT licensed, Copyright 2020-2022 Tero Karvinen http://TeroKarvinen.com))

Plugin for [micro-editor]() that allows you to jump to any function, class or heading using `fzf` and `ctags`.

## Demo

[https://asciinema.org/a/610756](https://asciinema.org/a/610756)

## Supported languages

Jump supports all languages supported by your ctags. Use `ctags --list-languages` to see the full list.
You can add more by editing `~/.ctags` (for example [julia ctags](https://github.com/JuliaEditorSupport/julia-ctags/blob/master/ctags)).

## Installation

Requires fzf, ctags and bash. On Debian you can install the required packages like this:

    $ sudo apt-get update
    $ sudo apt-get install micro fzf exuberant-ctags

In some Ubuntu versions, ctags package name is different and the command is
'sudo apt-get install micro fzf ctags'. For other Linuxes, just install the
packages that provide commands 'fzf', 'ctags' and 'bash'. If you are using a
non-Linux OS you are on your own.

After installing requirements you need to add the plugin repository to
`$HOME/.config/micro/settings.json`:

```json
{
  "pluginrepos": [
    "https://raw.githubusercontent.com/andriamanitra/micro-gotoctags/main/repo.json"
  ]
}
```

After adding the plugin repository you should be able to install it with

    $ micro -plugin install gotoctags

Now try it out!

## Usage

    $ micro example.py

Write some Python. Jump also supports Go, C, JavaScript...

```python
def hello():
    print("hello")

def bar():
    print("bar")

def foo():
    print("foo")
```

Save the file. Press Ctrl-E to bring up the command prompt and type `jumptag`.

Use up and down arrows to select a function. You can also type part of the name.
Press enter to jump.

Your cursor now landed on the function. Well done!

## Adding key bindings

Key bindings can be added in $HOME/.config/micro/bindings.json

For example:

    { "F3": "command:jumptag" }
