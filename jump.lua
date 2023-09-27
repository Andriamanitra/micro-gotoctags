-- gotoctags - jump to ctags using fzf
-- fork of https://github.com/terokarvinen/micro-jump (Copyright 2020-2022 Tero Karvinen http://TeroKarvinen.com)
-- MIT license

local config = import("micro/config")
local shell = import("micro/shell")
local micro = import("micro")

function init()
	config.MakeCommand("jumptag", jumptagCommand, config.NoComplete)
	config.AddRuntimeFile("jump", config.RTHelp, "help/jump.md")
end

function jumptagCommand(bp) -- bp BufPane
		local filename = bp.Buf.Path
		-- --sort=no shows symbols in file order
		local cmd = string.format("bash -c \"ctags -f - --sort=no --fields=n '%s'|fzf --layout=reverse", filename)
		local wait = false
		local getOutput = true
		local out = shell.RunInteractiveShell(cmd, wait, getOutput)
		local linenum = out:match("line:(%d+)")
		if linenum == nil then
			micro.InfoBar():Message("[micro-jump] jump cancelled")
			return
		end
		bp.Cursor.Y = tonumber(linenum) - 1
		micro.InfoBar():Message("[micro-jump] jumped to line " .. linenum)
end
