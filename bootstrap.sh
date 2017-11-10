#!/usr/bin/env bash
BASEDIR=$(cd $(dirname "$0"); pwd)

read -n1 -p "?This may overwrite existing files. Are you sure? (y/n) " REPLY;

echo $REPLY;

	if [ "$REPLY" != "y" ]; then
		exit 1;
	fi

cd $BASEDIR;
for file in *; do

	if [[ $file != README.md && $file != bootstrap.sh ]]; then
		if [ -e $HOME/.$file ]; then
			rm -r $HOME/.$file;
		fi

		echo "Symlink $BASEDIR/$file";
		ln -s $BASEDIR/$file $HOME/.$file;
	fi
done

if [ -f $HOME/.extra ]; then
	echo "Sourcing $HOME/.extra";
	source $HOME/.extra;
fi
