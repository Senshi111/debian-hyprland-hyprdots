#!/bin/bash
#|---/ /+----------------------------+---/ /|#
#|--/ /-| Main installation script    |--/ /-|#
#|-/ /--| Prasanth Rangan            |-/ /--|#
#|/ /---+----------------------------+/ /---|#

cat << "EOF"

-----------------------------------------------------------------
        .
 ⠀⢀⣴⣾⠿⠶⠷⣶⣄⠀
⢠⡟⠉⠀⢀⡤⢀⠈⢻⡧
⣿⠀⠀⢠⡇⠀⠀⡂⢸⡇
⢻⡀⠀⠘⠷⣤⣡⠴⠛⠁
⠈⢿⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠙⠦⣀⠀⠀⠀⠀⠀
   _       _  _
 _| |_    | || |_  _ _ __ _ _ __| |___| |_ ___
|_   _|   | __ | || | '_ \ '_/ _` / _ \  _(_-<
  |_|     |_||_|\_, | .__/_| \__,_\___/\__/__/
                |__/|_|

-----------------------------------------------------------------

EOF

#--------------------------------#
# import variables and functions #
#--------------------------------#
source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

#------------------#
# evaluate options #
#------------------#
flg_Install=0
flg_Restore=0
flg_Service=0

while getopts idrs RunStep
do
    case $RunStep in
    i) flg_Install=1 ;;
    d) flg_Install=1
        export use_default="-y" ;;
    r) flg_Restore=1 ;;
    s) flg_Service=1 ;;
    *)  echo "...valid options are..."
        echo "i : [i]nstall hyprland without configs"
        echo "r : [r]estore config files"
        echo "s : start system [s]ervices"
        exit 1 ;;
    esac
done

if [ $OPTIND -eq 1 ] ; then
    flg_Install=1
    flg_Restore=1
    flg_Service=1
fi

#------------#
# installing #
#------------#
if [ $flg_Install -eq 1 ] ; then
cat << "EOF"

 _         _       _ _ _
|_|___ ___| |_ ___| | |_|___ ___
| |   |_ -|  _| .'| | | |   | . |
|_|_|_|___|_| |__,|_|_|_|_|_|_  |
                            |___|

EOF

    #----------------------#
    # prepare package list #
    #----------------------#
    shift $((OPTIND -1))
    cust_pkg=$1
    cp custom_hypr.lst install_pkg.lst

    if [ -f "$cust_pkg" ] && [ ! -z "$cust_pkg" ] ; then
        cat $cust_pkg >> install_pkg.lst
    fi

    #--------------------------------#
    # install packages from the list #
    #--------------------------------#
    ./install_pkg.sh install_pkg.lst
    rm install_pkg.lst
fi

#---------------------------#
# restore my custom configs #
#---------------------------#
if [ $flg_Restore -eq 1 ] ; then
cat << "EOF"

             _           _
 ___ ___ ___| |_ ___ ___|_|___ ___
|  _| -_|_ -|  _| . |  _| |   | . |
|_| |___|___|_| |___|_| |_|_|_|_  |
                              |___|

EOF

    ./restore_fnt.sh
    ./restore_cfg.sh
fi

#---------------------------#
# update sddm, grub and zsh #
#---------------------------#
# if [ $flg_Install -eq 1 ] && [ $flg_Restore -eq 1 ] ; then
#     ./restore_sgz.sh
# fi

#------------------------#
# enable system services #
#------------------------#
if [ $flg_Service -eq 1 ] ; then
cat << "EOF"

                 _
 ___ ___ ___ _ _|_|___ ___ ___
|_ -| -_|  _| | | |  _| -_|_ -|
|___|___|_|  \_/|_|___|___|___|

EOF

    service_ctl NetworkManager
    service_ctl bluetooth
    service_ctl sddm  # Change 'gdm' to the appropriate display manager on Debian (e.g., 'lightdm')
fi

