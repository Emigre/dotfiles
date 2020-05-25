## Set up access to GitHub

1. Generate a ssh key: `ssh-keygen -t rsa -b 4096 -C "info@gasparrey.com"`

2. Start the ssh agent: `eval "$(ssh-agent -s)"`

3. Add the following `~/.ssh/config` file:

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

4. Add the ssh key to the ssh agent `ssh-add -K ~/.ssh/id_rsa`

5. Copy the public key `cat ~/.ssh/id_rsa.pub | pbcopy`

6. [Add the key to github](https://github.com/settings/keys) / [Add the key to bitbucket](https://bitbucket.org/account/user/Emigre/ssh-keys/)

7. Create `~/.gituser` with the git user name and email

```
[user]
  name = <name>
  email = <email>
```
