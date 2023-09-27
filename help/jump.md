# micro-gotoctags - Jump to function in micro editor

Jump to any function, class or heading using fzf and ctags.

This help file can be viewed in Micro editor with ctrl-E 'help gotoctags'.

## Supported languages

Jump supports all languages supported by your ctags. Use `ctags --list-languages` to see the full list.
You can add more by editing `~/.ctags` (for example [julia ctags](https://github.com/JuliaEditorSupport/julia-ctags/blob/master/ctags)).

## Prerequisites

Requires fzf, ctags and bash.

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

Use up and down arrows to select a function. You can also type part of the name. Press enter to jump.

Your cursor now landed on the function. Well done!

## Adding key bindings

Key bindings can be added in $HOME/.config/micro/bindings.json

For example:

	{ "F3": "command:jumptag" }
