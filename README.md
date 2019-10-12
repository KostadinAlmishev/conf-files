# conf-files
My conf files

## Customization commands

Enable minimize to click

```
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

## Gradle


```bash
# for bash
curl -s "https://get.sdkman.io" | bash

# for fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher add reitzig/sdkman-for-fish  

sdk install gradle 5.6.2
```

## Oracle instalation 

[Click](https://askubuntu.com/questions/1121649/how-to-install-oracle-18c-enterprise-edition-on-ubuntu-18-04)

docker)

[Click](https://developernote.com/2019/03/running-oracle-database-in-a-docker-container-on-ubuntu-18-04/)

[Working way](https://github.com/fuzziebrain/docker-oracle-xe)

## [Change docker Root](https://github.com/IronicBadger/til/blob/master/docker/change-docker-root.md)

```
Docker: Delta RPMs disabled because /usr/bin/applydeltarpm not installed.

You don't need to do something, but you can, especially if you have a slow internet connection. If you install deltarpm support:

yum install deltarpm

you will download only the differences with older versions of already installed packages. This is done at the cost of increased processing time.
```

## [GitHub labels](https://github.com/jasonbellamy/git-label-packages)
