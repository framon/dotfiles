#!/usr/bin/env bash
BASEDIR=$(cd $(dirname "$0"); pwd)

read -n1 -p "?This may overwrite existing files. Are you sure? (y/n) " REPLY;

echo $REPLY;

    if [ "$REPLY" != "y" ]; then
        exit 1;
    fi

cd $BASEDIR;
for file in *; do

    if [[ "$file" =~ ^(bootstrap.sh|bashrc|LICENSE|README.md)$ ]]; then
        echo "Skipping $file"
    else
        if [ -e "$XDG_CONFIG_HOME/$file" ]; then
            mv "$XDG_CONFIG_HOME/$file" "$XDG_CONFIG_HOME/$file.bak";
        fi

        echo "Symlink $BASEDIR/$file";
        ln -s "$BASEDIR/$file" "$XDG_CONFIG_HOME/$file";
    fi
done

if [ -e "$HOME/.bashrc" ]; then
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak";
fi

echo "Symlink $BASEDIR/bashrc";
ln -s "$BASEDIR/bashrc" "$HOME/.bashrc";

if [ -f $HOME/.extra ]; then
    echo "Sourcing $HOME/.extra";
    source $HOME/.extra;
fi
