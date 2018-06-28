# pull all git repos in ~/catkin_ws/src
function update() {
  CURR_DIR=$(pwd)
  cd ~/catkin_ws/src/
  for d in *
  do
    cd ~/catkin_ws/src/$d
    echo -e "\e[0;32m~/catkin_ws/src/$d:\e[0m"
    git pull
  done
  cd $CURR_DIR
}

function cb() {
  CURR_DIR=$(pwd)
  cd ~/catkin_ws/
  catkin build $1
  cd $CURR_DIR
}

function dragonfly() {
  sshpass -p 'linaro' ssh -Y -R 52698:localhost:52698 dragonfly$1@dragonfly$1
}

function master_dragonfly() {
  export ROS_MASTER_URI=http://dragonfly15:11311/
  export ROS_HOSTNAME=dragonfly15
}

function master_local() {
  export ROS_MASTER_URI=http://localhost:11311/
  export ROS_HOSTNAME=localhost
}

function add_date() {
  filename=$(basename $1)
  extension=${filename##*.}
  filename="${filename%.*}"
  mv $1 $(now)-${filename}.${extension}
}

function hist() {
  if [ $# -eq 0 ]
  then
    history
  else
    history | grep -i $1
  fi
}

function ff() {
  find . -iname *$1* | grep -i $1
}

function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
  else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
  fi
}

function targz() {
  tar -zcvf $1.tar.gz $1; 
}

function untargz() {
  tar -zxvf $1; rm -ir $1;
}

function mkcd() {
  mkdir -p $1; cd $1
}