mviz() {
    rviz -d $(rospack find ee545)/config/default.rviz
}

export UW_TOOLS_SHELL_FLAVOR=zsh
. /home/ee545au26/mushr_ws/src/mushr545/ee545/config/env.sh
export SOURCES_ROOT="/home/ee545au26/mushr_ws/src/mushr545/ee545/src/uw_tools"

export PATH="/home/ee545au26/mushr_ws/src/mushr545/ee545/scripts/available_client/:$PATH"
. "/home/ee545au26/mushr_ws/src/mushr545/ee545/scripts/uw_tools_client"

