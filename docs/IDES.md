## Sublime Text

Add these to the keymap settings to turn off auto-closing of brackets and quotes:

```json
[
	{ "keys": ["("], "command": "insert", "args": {"characters": "("} },
	{ "keys": [")"], "command": "insert", "args": {"characters": ")"} },
	{ "keys": ["["], "command": "insert", "args": {"characters": "["} },
	{ "keys": ["]"], "command": "insert", "args": {"characters": "]"} },
	{ "keys": ["{"], "command": "insert", "args": {"characters": "{"} },
	{ "keys": ["}"], "command": "insert", "args": {"characters": "}"} },
	{ "keys": ["'"], "command": "insert", "args": {"characters": "'"} },
	{ "keys": ["\""], "command": "insert", "args": {"characters": "\""} }
]
```

Add these to the settings:

```json
{
	"trim_trailing_white_space_on_save": true,
	"ensure_newline_at_eof_on_save": false
}
```

## JetBrains IDEs

Install the following plugins via Preferences > Plugins:
- IdeaVim
- IdeaVim-EasyMotion
- AceJump

Set these keys in Preferences > Keymap:
- Go To File: Ctrl-P
- Project: Ctrl-F
- Focus Editor: Ctrl-[
- Jump to Source: Ctrl-M
- Find in Path: Ctrl-A
- Replace: Ctrl-S

For each one of these, in Editor > Vim emulation, set the handler to IDE

In the menu bar:
- View > Appearance:
	- Disable Tool Window Bars

In the Project Tool:
	- Move the tool to the right side
	- Select 'Always Select Opened File'

In Preferences:
- Editor:
	- Vim emulation:
		- Set handler for Ctrlp-P, Ctrl-F, etc. to IDE
	- General:
		- Select Strip trailing spaces on Save for All
		- Select Delete trailing spaces on caret line
		- Select Ensure an empty line at the end of a file on Save
		- Appearance:
			- Deselect Show line numbers
			- Deselect Show intention bulb
		- Gutter Icons:
			- Deselect Show gutter icons
		- Breadcrumbs:
			- Deselect Show breadcrumbs
		- Editor Tabs:
			- Select Open new tabs at the end
			- Select Use small fonts for labels
			- Select Mark modified
	- Code Editing
		- Uncheck 'Highlight Usages of element at caret'
	- Code Scheme > General:
		- Warning: no effect, error stripe mark #9876AA, background #564A66, foreground #2B2E2F
		- Weak Warning: effect underwaved #9876AA
		- Error: no effect, error stripe mark #9E2927, background #803F43, foreground #2B2E2F
- Version Control > File Status Colors:
		- Deleted / Deleted from filesystem: #D5756C
		- Ignored: #666666
		- Renamed / Unknown: #6897BB
- Languages & Frameworks:
	- Markdown:
		- Default Layout: Editor only