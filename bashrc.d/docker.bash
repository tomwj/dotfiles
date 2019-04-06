# Path updated to match mounted location
#export DOCKER_CERT_PATH="/c/Users/tom/.docker/machine/machines/default"
#export DOCKER_MACHINE_NAME="default"
#export COMPOSE_CONVERT_WINDOWS_PATHS="true"
# Run this command to configure your shell: 
# eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env --shell bash)

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/home/t/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval $(docker-machine env default)

