if [ -f ~/.bashrc ]; then
   . ~/.bashrc;
fi

PS1='${debian_chroot:+($debian_chroot)}\h:\W \u\$ '
