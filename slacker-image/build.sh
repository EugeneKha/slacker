#!/bin/bash

set -e

docker_image_tag="latest"
docker_image_name="eugenekha/slacker"

build() {

	echo "Building docker image..."

	docker build -t $docker_image .

	echo "Building docker image..."

}

push() {
	echo "push $tag"
}




args=( "$@" )
cmds=()

for (( i=0; i<=${#args[@]}; i++ ))
do
   	if [ "${args[$i]}" = 'build' ] || [ "${args[$i]}" = 'push' ]
   		then
   			cmds+=("${args[$i]}")
   	fi
   	
   	if [ "${args[$i]}" = 'tag' ]
   		then
   			((i++))
   			docker_image_tag=${args[$i]}
   	fi
done

docker_image="$docker_image_name:$docker_image_tag"

for cmd in ${cmds[@]}
do
	$cmd
done
