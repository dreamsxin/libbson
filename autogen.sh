#!/bin/sh

if GTKDOCIZE=$(which gtkdocize 2>/dev/null); then
         gtkdocize --docdir doc/
         gtkdocargs=--enable-gtk-doc
else
        echo "You don't have gtk-doc installed, and thus won't be able to generate the documentation."
        echo 'EXTRA_DIST =' > doc/gtk-doc.make
fi

args="$gtkdocargs --enable-maintainer-flags"

autoreconf -fiv
./configure $args "$@"
