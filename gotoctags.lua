-- gotoctags - jump to ctags using fzf
-- fork of https://github.com/terokarvinen/micro-jump (Copyright 2020-2022 Tero Karvinen http://TeroKarvinen.com)
-- MIT license

VERSION = "1.0.0"

local config = import("micro/config")
local shell = import("micro/shell")
local micro = import("micro")

function init()
    config.MakeCommand("jumptag", jumptagCommand, config.NoComplete)
    config.AddRuntimeFile("gotoctags", config.RTHelp, "help/gotoctags.md")
end

function jumptagCommand(bufpane)
    local filename = bufpane.Buf.Path
    -- --sort=no shows symbols in file order
    local cmd = string.format("ctags -f - --sort=no --fields=n '%s' | awk -F'\\t' '{printf \\\"%%4d %%s\\n\\\", substr(\\$NF,6), \\$1}' | fzf --reverse", filename)
    local wait = false
    local getOutput = true
    local out = shell.RunInteractiveShell(string.format("bash -c \"%s\"", cmd), wait, getOutput)
    local linenum = out:match("%d+")
    if linenum == nil then
        micro.InfoBar():Message("[gotoctags] jump cancelled")
        return
    end
    bufpane.Cursor.Y = tonumber(linenum) - 1
    micro.InfoBar():Message("[gotoctags] jumped to line " .. linenum)
end
