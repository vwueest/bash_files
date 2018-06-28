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