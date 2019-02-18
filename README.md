## Requirements

1. Install [homebrew](https://brew.sh/)

2. Install ansible and git: `brew install ansible git`

## Set up ssh access to github

1. Generate a ssh key: `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

2. Start the ssh agent: eval `"$(ssh-agent -s)"`

3. Add the following `~/.ssh/config` file:

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

4. Add the ssh key to the ssh agent `ssh-add -K ~/.ssh/id_rsa`

5. [Add the ssh key to the github account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

## Usage

1. Clone the dotfiles repo `git clone git@github.com:Emigre/dotfiles.git ~/dotfiles`

2. Run `make start` in the `dotfiles` folder
