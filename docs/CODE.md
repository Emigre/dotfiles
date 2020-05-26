## Code analysis, Formatting and Linting

|                             | IDE      | code analysis and completion   | autoformat                         | lint                                      |
|:----------------------------|:---------|:-------------------------------|:-----------------------------------|:------------------------------------------|
| C and C++                   | CLion    | ?                              | ?                                  | ?                                         |
| JavaScript and TypeScript   | IntelliJ | tsc (IDE), js graphql (plugin) | prettier (plugin)                  | eslint (IDE)                              |
| Python                      | PyCharm  | ?                              | ?                                  | ?                                         |
| Swift and Objective-C       | AppCode  | ?                              | ?                                  | ?                                         |

In Preferences > Tools > File Watchers add all files that need to be formatted on save, such as Typescript, Typescript JSX and Javascript for Prettier. For each, in 'Scope' select 'Current File'.

In Preferences > Editor > Inspections disable the 'JavaScript and TypScript' and 'Proofreading' inspections and change all 'Warning' and 'Error' inspections to 'Weak Warning'.
