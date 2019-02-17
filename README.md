## Requirements

[Homebrew](https://brew.sh/)

## Setup

Install ansible and git

```
brew install ansible
brew install git
```

Generate a ssh key

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Start the ssh agent

```
eval "$(ssh-agent -s)"
```

Add the following `~/.ssh/config` file:

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

Add the ssh key to the ssh agent

```
ssh-add -K ~/.ssh/id_rsa
```

[Add the ssh key to the github account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

Clone the dotfiles repo

```
git clone git@github.com:Emigre/dotfiles.git ~/dotfiles
```

## Usage

Run `make start` in the `dotfiles` folder
