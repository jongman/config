#!/bin/bash
pushd `dirname $0` > /dev/null
HERE=`pwd`
popd > /dev/null
for SRC in _*; do
	DEST=$(echo $SRC | sed "s/^_/./g")
	echo ln -sf $HERE/$SRC ~/$DEST
	ln -sf $HERE/$SRC ~/$DEST
done
