## Code analysis, Formatting and Linting

|                             | code analysis and completion | format (on save)                   | lint                                      |
|:----------------------------|:-----------------------------|:-----------------------------------|:------------------------------------------|
| C and C++                   | ?                            | ?                                  | ?                                         |
| Elixir                      | ?                            | ?                                  | ?                                         |
| Haskell                     | ?                            | ?                                  | ?                                         |
| Java                        | ?                            | ?                                  | ?                                         |
| JavaScript and TypeScript   | (IntelliJ uses tsc)          | Prettier plugin, JS GraphQL plugin | (Intellij uses eslint)                    |
| Kotlin                      | ?                            | ?                                  | ?                                         |
| Python                      | ?                            | ?                                  | ?                                         |
| Scheme                      | ?                            | ?                                  | ?                                         |
| Swift and Objective-C       | ?                            | ?                                  | ?                                         |

In Preferences > Tools > File Watchers add all files that need to be formatted on save, such as Typescript, Typescript JSX and Javascript for Prettier. For each, in 'Scope' select 'Current File'.

In Preferences > Editor > Inspections disable the 'JavaScript and TypScript' and 'Proofreading' inspections and change all 'Warning' and 'Error' inspections to 'Weak Warning'.
