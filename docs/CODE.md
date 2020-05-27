## Code analysis, Formatting and Linting

### AppCode

|                              |                     |
|:-----------------------------|---------------------|
| code analysis and completion | ?                   |
| auto format                  | ?                   |
| code linting                 | ?                   |

### CLion

|                              |                     |
|:-----------------------------|---------------------|
| code analysis and completion | ?                   |
| auto format                  | ?                   |
| code linting                 | ?                   |

### IntelliJ

|                              |                     |
|:-----------------------------|---------------------|
| code analysis and completion | tsc                 |
|                              | js graphql (plugin) |
| auto format                  | prettier (plugin)   |
| code linting                 | eslint              |


### PyCharm

|                              |                     |
|:-----------------------------|---------------------|
| code analysis and completion | ?                   |
| auto format                  | ?                   |
| code linting                 | ?                   |


In Preferences > Tools > File Watchers add all files that need to be formatted on save, such as Typescript, Typescript JSX and Javascript for Prettier. For each, in 'Scope' select 'Current File'.

In Preferences > Editor > Inspections disable the 'JavaScript and TypScript' and 'Proofreading' inspections and change all 'Warning' and 'Error' inspections to 'Weak Warning'.
