## How to set up multiple accounts with Mutt

http://www.df7cb.de/blog/2010/Using_multiple_IMAP_accounts_with_Mutt.html

https://gist.github.com/miguelmota/9456162

##### Instructions

Directories and files

```bash
~/
|── .mutt/
|   ├── account.com.gmail.foo
|   ├── account.com.gmail.bar
|   ├── com.gmail.foo/
|   └── com.gmail.bar/
└── .muttrc
```

###### `~/.muttrc`

```bash
# Folder hooks
folder-hook 'account.com.gmail.foo' 'source ~/.mutt/account.com.gmail.foo'
folder-hook 'account.com.gmail.bar' 'source ~/.mutt/account.com.gmail.bar'

# Default account
source ~/.mutt/account.com.gmail.foo

# Macros for switching accounts
macro index <f2> '<sync-mailbox><enter-command>source ~/.mutt/account.com.gmail.foo<enter><change-folder>!<enter>'
macro index <f3> '<sync-mailbox><enter-command>source ~/.mutt/account.com.gmail.bar<enter><change-folder>!<enter>'

# Fetch mail shortcut
bind index G imap-fetch-mail
```

###### `~/.mutt/account.com.gmail.foo`

```bash
# vim: filetype=muttrc
set imap_user = "foo@gmail.com"
set imap_pass = "<PASSWORD>"
set smtp_url = "smtp://foo@smtp.gmail.com:587/"
set smtp_pass = "<PASSWORD>"
set from = "foo@gmail.com"
set realname = "Foo"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/com.gmail.foo/cache/headers
set message_cachedir = ~/.mutt/com.gmail.foo/cache/bodies
set certificate_file = ~/.mutt/com.gmail.foo/certificates
```

###### `~/.mutt/account.com.gmail.bar`

```bash
# vim: filetype=muttrc
set imap_user = "bar@gmail.com"
set imap_pass = "<PASSWORD>"
set smtp_url = "smtp://bar@smtp.gmail.com:587/"
set smtp_pass = "<PASSWORD>"
set from = "bar@gmail.com"
set realname = "Bar"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/com.gmail.bar/cache/headers
set message_cachedir = ~/.mutt/com.gmail.bar/cache/bodies
set certificate_file = ~/.mutt/com.gmail.bar/certificates
```
