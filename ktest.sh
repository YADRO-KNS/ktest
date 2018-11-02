#!/bin/sh

[ -f /etc/profile ] && . /etc/profile
[ -z "$PS1" ] && export PS1="$_name:\${PWD}# "
exec sh -i -l

exit 0
