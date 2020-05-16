## JetBrains IDEs

```
+-------------+
| ± reload    |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Q close      |W            |E            |R go related |T s type doc |Y            |U            |I            |O            |P            |[            |]            |
|M-Q cls othr |             |C-E recent   |             |M-T s ty inf |             |M-U prev brk |             |             |C-P ctrlp    |C-[ hide prj |             |
|             |_-W s params |_-E s error  |_-R s implem |_-T s ty def |_-Y go...    |_-U/u go use |_-I nxt splt |_-O split    |_-P/p path   |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|A            |S save       |D delete     |F kjump      |G            |H prev tab   |J pgdown     |K pgup       |L nxt tab    |; nxt err    |' prev err   |\            |
|             |M-S nxt brk  |             |             |             |             |             |M-K cut      |             |_-; go decl  |             |             |
|_-A find     |_-S replace  |_-D go tree  |_-F struct   |_-G annotate |_-H hghlght  |             |             |             |_-: go src   |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Z            |X            |C            |V            |B            |N            |M            |,<           |.>           |/?           |
|             |             |             |             |             |             |             |             |             |             |
|_-Z refac... |_-X code...  |_-C comment  |_-V git...   |_-B build... |             |             |             |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
```

1. Install each IDE with brew (`brew cask install clion`, `brew cask install intellij-idea`, `brew cask install appcode`...).

2. In Preferences > Plugins install `IdeaVim`, `KJump` and `File Watchers`

3. Check the [code analysis, formatting and linting table](docs/CODE.md) to install plugins and tools for each language.

### Preferences

In Preferences > Other Settings > KJump set the background color to #ff286e17

Set these keys in Preferences > Keymap:
- Go To File: Ctrl-P, remove the default
- Recent Files: Ctrl-O, leve the default (Ctrl-E), and leave the handler set to Vim
- Focus Editor: Ctrl-[ (to exit the project window)
- Jump to Source: Ctrl-M (to open file in the project window)

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
			- HTML/CSS:
				- Deselect everything
	- Code Editing
		- For 'The Next Error goes through', select 'All problems'
	- Color Scheme > General:
		- Matched brance: no background
		- Caret row: no background
		- Warning: no effect, error stripe mark #9876AA, background #3B3A54
		- Weak Warning: effect underwaved #9876AA, no stripe mark
		- Error: no effect, error stripe mark #9E2927, background #45262D
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
