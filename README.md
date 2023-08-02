# Percy's .dotfiles Repository

To make use of the automation scripts, a few prerequisites are recommended:

```bash
sudo apt-get install stow xargs
```

There may be submodules in this repo. To clone and pull all submodules, clone this repo with `--recurse-submodules`:
```bash
git clone https://github.com/PercyJax/dotfiles.git --recurse-submodules
```

## Safe-Install Configurations
> This will only create new links if files don't already exist and will skip already existant links.

1. Run `./safe-install-user.sh` or `./safe-install-root.sh` and it will attempt to install links, aborting if there are files in the target directory.

## Install (pull in and link) Configurations

> This will change files in this dotfiles repository. Make sure you have committed any changes you want to keep.

1. Fork this repo / setup a remote you have push rights to.

2. Run `./install-user.sh` or `./install-root.sh` and all the files and folders reflected in the respective `USERHOME` and `FSROOT` folders will be pulled into this directory, and symlinks will be left in their place.
    > **IMPORTANT NOTE**:
    > 
    > After you run this command, *DO NOT MOVE OR DELETE THIS FOLDER* without first "uninstalling". The original files have been pulled into this repo and a symlink has been left in its place. Deleting or moving this folder will break those links.

3. Inspect the changes using `git diff` and commit the ones you want to keep, revert the changes for the ones you don't want to keep, or cherry pick through the changes.

## Uninstall (unlink and replace) Configurations

1. Run `./uninstall-user.sh` or `./uninstall-root.sh` and the symlinks will be replaced with a copy of whatever is in their respective folders.

2. You are now free to move or delete this folder.

## Run-once (replace running .dotfiles with ones in this repo)

1. Run `./replace-user.sh` or `./replace-root.sh` and it will be the same as running `./install-***.sh`, reverting any changes made to this repository, and running `./uninstall-***.sh`, leaving real files in their place.
    > **NOTE**:
    >
    > You probably want to make sure that there aren't any blank placeholder files* in the repo before you run this. This will effectively replace the running config file with a blank file. 
    >
    > *Usually there is no reason to have a blank config file commited into version control. They are useful for [adding configurations](#adding-configurations) and should be dealt with before committing to the vcs or running `./replace`.

## Adding Configurations

1. Determine if this file is somewhere you can reach from `/` (FSROOT) or `~/` (USERHOME)
   
2. Create a subfolder with the name whatever the configuration is for (i.e. `./USERHOME/starship` for starship config)

3. Recreate the path inside of that subfolder and `touch` a blank file with the name of whatever you want to track. Note that this only works for individual files and not whole directories.
   
   For example: I want to track `~/.config/starship.toml` so I run the following:
   ```bash
   mkdir -p ./USERHOME/starship/.config
   touch ./USERHOME/starship/.config/starship.toml
   ```

4. Alternatively, just move or copy the files themselves into the repo. This is useful if there are lots of nested folders and files.

5. Run `./install-user.sh` and `./USERHOME/starship/.config/starship.toml` will be overwritten with whatever is currently at `~/.config/starship.toml`.

6. Don't forget to add and commit this file to the repository.