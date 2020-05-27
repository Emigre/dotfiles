## Code analysis, Formatting and Linting

### AppCode

|                              | Swift               |
|:-----------------------------|:--------------------|
| code analysis and completion | builtin             |
| auto format                  | ---                 |
| code linting                 | ---                 |

If using C++ files, clang-format can be enabled with file watchers as in CLion.

### CLion

|                              | C++                                                                                 |
|:-----------------------------|:------------------------------------------------------------------------------------|
| code analysis and completion | builtin + clangd (embedded)                                                         |
| auto format                  | clang-format (embedded, clang-format also globally installed for the file watchers) |
| code linting                 | clang-tidy (embedded)                                                               |

Select Preferences > Editor > Code Style > Enable ClangFormat to use clang-format via the clangd server.

In Preferences > Tools > File Watchers for every file type that needs to be formatted on save (C/C++, CMake...):
- Click + to add a new file watcher and select the custom template
- Give it a name
- In 'File type', select the file type
- In 'Scope' select 'Current File'
- In 'Program' write `/usr/local/bin/clang-format`
- In 'Arguments' write `-style=file -i $FileName$`
- In Output paths to refresh write `$FileName$`
- In Working direectory write `$FileDir$`
- Uncheck 'Auto-save edited files to trigger the watcher'

### IntelliJ

|                              | TypeScript                                           |
|:-----------------------------|:-----------------------------------------------------|
| code analysis and completion | builtin + tsc (embedded)                             |
|                              | js graphql plugin (graphql installed in the project) |
| auto format                  | prettier plugin (prettier installed in the project)  |
| code linting                 | eslint (installed in the project)                    |

In Preferences > Tools > File Watchers for every file type that needs to be formatted on save (TypeScript, TypeScript JSX, JavaScript...):
- Click + to add a new file watcher and select the Prettier template
- In 'File type', select the file type
- In 'Scope' select 'Current File'
- Keep the defaults, the program should be `$ProjectFileDir$/node_modules/.bin/prettier`

In Preferences > Editor > Inspections: disable the 'JavaScript and TypScript' and 'Proofreading' inspections and change all 'Warning' and 'Error' inspections to 'Weak Warning'.
