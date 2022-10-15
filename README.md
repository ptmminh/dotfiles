# dotfiles

Personal dotfiles for working across platforms, machines, servers. Always Unix (preferably Linux/Ubuntu) though. Linux is obviously the best OS for development!🤩

I work across many machines (work vs personal laptop, different servers for each project). I live in the `bash` shell so increasingly some sort of "global" configs under version control is much needed to synchronize.

## Usage

Pick and choose which dotfile to use and symlink it in the right location. Example:

```
# change pwd to home directory
cd
# rename current .bashrc to avoid being overwritten
mv .bashrc .bashrc_local
ln -s <path_to_repo>/.bashrc .
```

## Semantic commits

I'm a little religious about `git` (linear) history. I try to follow commit message convention [here](https://github.com/angular/angular/blob/main/CONTRIBUTING.md). 
This also facilitates automatic releases and versioning but of course a little bit of an overkill for this repo since we don't quite need CI/CD facility.