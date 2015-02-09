# iTerm2

## Loading configuration

Configure iTerm2 to use this directory for its configuration file:

![image](https://cloud.githubusercontent.com/assets/692632/6100648/52a0136e-afc8-11e4-93c1-656d4eaf63da.png)

## Exporting configuration

1. Click the button called **Save Settings to Folder**:

![image](https://cloud.githubusercontent.com/assets/692632/6100690/0a76976a-afc9-11e4-9eb1-b3f96c6a1990.png)

1. Check in the changes at `~/dotfiles`

```
$ cd ~/dotfiles
$ git add iterm2
$ git fetch && git reset --hard origin/master
$ git commit -m "Updated iTerm2 preferences"
$ git push origin master
```

Then, catch your local `dotfiles` repo up by running the `update_dotfiles` command:

```
$ update_dotfiles
```
