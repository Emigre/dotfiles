## JetBrains IDEs

```
+-------------+
| ± reload    |
| § highlight |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Q close      |W            |E            |R            |T            |Y            |U            |I            |O            |P            |[            |]            |
|M-Q cls othr |             |C-E recent   |             |             |             |             |             |             |C-P ctrlp    |C-[ hide prj |             |
|             |             |             |             |             |             |             |             |             |_-P path     |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|A            |S save       |D            |F kjump      |G            |H prev tab   |J pgdown     |K pgup       |L nxt tab    |; go src     |' nxt err    |\            |
|C-A fnd path |C-S replace  |             |C-F view prj |_-G annotate |             |             |             |             |             |M-' prev err |             |
|             |             |             |_-F struct   |             |             |             |             |             |             |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Z            |X            |C            |V            |B            |N            |M            |,<           |.>           |/?           |
|             |             |             |             |             |             |C-M prj open |             |             |             |
|             |             |             |             |             |             |             |             |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
```

1. Install each IDE with brew (`brew cask install clion`, `brew cask install intellij-idea`, `brew cask install appcode`...).

2. In Preferences > Plugins install `IdeaVim`, `KJump` and `File Watchers`

3. Check the [code analysis, formatting and linting table](docs/CODE.md) to install plugins and tools for each language.

### Preferences

In Preferences > Other Settings > KJump set the background color to #ff286e17

Set these keys in Preferences > Keymap:
- Focus Editor: Ctrl-[
- Recent Files: Ctrl-O, leve the default (Ctrl-E), and leave the handler set to Vim
- Project: Ctrl-F
- Find in Path: Ctrl-J
- Replace: Ctrl-K
- Jump to Source: Ctrl-M
- Go To File: Ctrl-P, remove the default

For each one of these except for 'Recent Files', in Editor > Vim emulation, set the handler to IDE

In Help > Edit Custom Properties, write these:

```
ide.find.enter.as.ok=true
```

In the menu bar:
- View > Appearance:
	- Disable Tool Window Bars

In the Project Tool:
	- Move the tool to the right side
	- Do NOT select 'Always Select Opened File' or 'Open Files With Single Click'

In Preferences:
- Appearance & Behaviour:
	- File Colors: Remove all  the local colors from the Local colors list
- Editor:
	- Inlay Hints: Deselect 'Show hints for' so none are selected
	- General:
		- Select Strip trailing spaces on Save for All
		- Select Delete trailing spaces on caret line
		- Select Ensure an empty line at the end of a file on Save
		- Deselect Highlight lines with whitespace-only modifications with a different color
		- Appearance:
			- Deselect Show line numbers
			- Deselect Show hard wrap and visual guides
			- Deselect Show intention bulb
		- Code Folding:
			- Deselect any code folding
		- Gutter Icons:
			- Deselect Show gutter icons
		- Breadcrumbs:
			- Deselect Show breadcrumbs
		- Editor Tabs:
			- Select Open new tabs at the end
			- Select Mark modified
		- Smart Keys:
			- Deselect 'Insert paired brackets' and 'Insert pair quote'
	- Code Editing
		- Uncheck 'Highlight Usages of element at caret'
	- Code Scheme > General:
		- Caret row: no background
		- Warning: no effect, error stripe mark #9876AA, background #564A66, foreground #2B2E2F
		- Weak Warning: effect underwaved #9876AA, no stripe mark
		- Error: no effect, error stripe mark #9E2927, background #803F43, foreground #2B2E2F
		- TODO defaults: no effect, no background, no foreground, no stripe mark
- Version Control > File Status Colors:
		- Deleted: #D5756C
		- Deleted from filesystem: #D5756C
		- Ignored: #666666
		- Renamed: #6897BB
		- Unknown: #909090
- Languages & Frameworks:
	- Markdown:
		- Default Layout: Editor only

## Sublime Text

Symlink `subl` if necessary: `ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

In the View menu, select Hide minimap.

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
