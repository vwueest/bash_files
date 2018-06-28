# add misc bash file
if [ -f ~/bash_files/misc.bash ]; then
    . ~/bash_files/misc.bash
fi


# OWN THINGS
# add color bash file
if [ -f ~/bash_files/color.bash ]; then
    . ~/bash_files/color.bash
fi

# add aliases bash file
if [ -f ~/bash_files/aliases.bash ]; then
    . ~/bash_files/aliases.bash
fi

# add functions bash file
if [ -f ~/bash_files/functions.bash ]; then
    . ~/bash_files/functions.bash
fi



# set the master
master_local
