## JetBrains IDEs

```
+-------------+
| ± reload    |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Q close      |W            |E            |R go related |T s type inf |Y            |U            |I            |O            |P            |[            |]            |
|M-Q cls othr |             |C-E recent   |M-R go struc |M-T s ty doc |             |M-U prev brk |             |             |C-P ctrlp    |C-[ hide prj |             |
|             |             |             |             |             |             |             |             |             |             |             |             |
|             |_-W s params |_-E s error  |_-R s implem |_-T s ty def |             |_-U/u go use |_-I nxt splt |_-O split    |_-P/p path   |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|A            |S save       |D delete     |F jump       |G            |H prev tab   |J pgdown     |K pgup       |L nxt tab    |; nxt err    |' prev err   |\            |
|             |M-S nxt brk  |             |C-F search   |C-G search   |             |             |M-K cut      |             |             |             |             |
|             |             |             |  for symbol |  in path    |             |             |             |             |_-; go decl  |             |             |
|             |_-S %s/      |_-D go tree  |_-F nav bar  |_-G/g git    |_-H highlght |_-Y go...    |             |             |_-: go src   |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
|Z            |X            |C            |V            |B            |N            |M            |,<           |.>           |/?           |
|             |             |             |             |             |             |             |             |             |             |
|             |             |             |             |             |             |             |             |             |             |
|_-Z refac... |_-X code...  |_-C comment  |             |_-B build... |             |_-M/m menu   |             |             |             |
+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+-------------+
```

1. Install each IDE with brew (`brew cask install clion`, `brew cask install appcode`, `brew cask install webstorm`, `brew cask install intellij-idea`, `brew cask install pycharm`...).

2. In Preferences > Plugins install `IdeaVim`, `AceJump` and `File Watchers`

3. Check the [code analysis, formatting and linting table](CODE.md) to install plugins and tools for each language.

### Preferences

Set these keys in Preferences > Keymap and the default in Editor > Vim emulation:

| Action                                                            | Key            | Handler   | Notes                               |
|:------------------------------------------------------------------|:---------------|:----------|:------------------------------------|
| Editor Actions > Cut up to Line End                               | ---            | ---       | Remove ^K                           |
| Editor Actions > Down                                             | Ctrl-J         | IDE       | Remove ^N                           |
| Editor Actions > Enter                                            | Ctrl-M         | Vim       |                                     |
| Editor Actions > Escape                                           | Ctrl-[         | Vim       |                                     |
| Editor Actions > Focus Editor                                     | Ctrl-I         | Vim       |                                     |
| Editor Actions > Left                                             | Ctrl-H         | Vim       | Remove ^B                           |
| Editor Actions > Move Caret to Line End                           | ---            | ---       | Remove ^E                           |
| Editor Actions > Right                                            | Ctrl-L         | IDE       | Remove ^F                           |
| Editor Actions > Tab                                              | Ctrl-I         | Vim       |                                     |
| Editor Actions > Up                                               | Ctrl-K         | IDE       | Remove ^P                           |
| Main menu > Edit > Find > Find in Path                            | Ctrl-G         | IDE       | Remove ⇧⌘F and unassign from others |
| Main menu > View > Jump to Source                                 | Ctrl-M         | Vim       |                                     |
| Main menu > View > Recent Files                                   | Ctrl-O, Ctrl-E | Vim, IDE  | Remove ⌘E                           |
| Main menu > View > Recent Locations                               | Cmd-Ctrl-E     | ---       | Remove ⇧⌘E                          |
| Main menu > View > Toggle Changed Only Files                      | Ctrl-E         | IDE       | Remove ⌘E                           |
| Main menu > Navigate > Search Everywhere                          | Ctrl-F         | IDE       |                                     |
| Main menu > Navigate > Go To File                                 | Ctrl-P         | IDE       | Remove ⇧⌘O and unassign from others |
| Main menu > Window > Active Tool Window > Hide Active Tool Window | Ctrl-[         | Vim       | Remove ⇧Esc                         |

In the menu bar:
- View > Appearance:
	- Disable Tool Window Bars, Status Bar and Navigation Bar

In the Project Tool:
- Right click and 'Mark Directory as Excluded' any folder that should not be searched in (coverage, build...)
- Select or unselect 'Show Excluded Files' to show or hide those folders in the Project Files Tool Window
- Move the tool to the right side
- Do NOT select 'Open Files With Single Click' nor 'Always Select Opened File'

In Preferences:
- Appearance & Behavior:
	- File Colors:
		- Remove all  the local colors from the Local colors list
	- Appearance:
		- Select 'Always show full path in window header'
- Editor:
	- Inlay Hints:
		- Deselect 'Show hints for' so none are selected
	- General:
		- Strip trailing spaces on Save: select 'All'
		- Select Delete trailing spaces on caret line
		- Select Ensure an empty line at the end of a file on Save
		- Deselect Highlight lines with whitespace-only modifications with a different color
		- Auto import:
			- Deselect all
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
				- Deselect everything except Simultaneous tag editing
	- Code Editing
		- For 'The Next Error goes through', select 'All problems'
	- Font: Set 'Size' 12 and 'Line spacing' 1.1
	- Color Scheme > General:
		- Matched brace: no background
		- TODO defaults: no effect, no background, no foreground, no stripe mark
		- Caret row: no background
		- Warning: no effect, error stripe mark #9876AA, background #3B3A54
		- Weak Warning: effect underwaved #9876AA, no stripe mark
		- Error: no effect, error stripe mark #9E2927, background #45262D
- Version Control > File Status Colors:
	- Deleted: #D5756C
	- Deleted from filesystem: #D5756C
	- Ignored: #666666
	- Renamed: #6897BB
	- Unknown: #909090
- Languages & Frameworks:
	- Markdown:
		- Default Layout: Editor only
- Tools:
	- AceJump:
		- Jump mode color: #34E210
		- Tag background color: #208C0A
		- Tag foreground color: #34E210
		- Text highlight color: #286E17
	- Web Browsers:
		- Disable Show browser popup in the editor

After a 'Find in Path' command, in the ocurrences tool window:
- In 'Group by' select 'Package'

## Sublime Text

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
