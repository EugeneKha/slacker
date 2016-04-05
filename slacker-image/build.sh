#!/bin/bash

set -e

docker_image_tag="latest"
docker_image_name="eugenekha/slacker"

build() {

	echo "Building docker image..."

	docker build -t $docker_image .
}

push() {
	docker push $docker_image
}

login() {
	docker login
}

usage() {
	echo
	echo "Usage:"
	echo "	./build.sh [login] [build] [push] [tag DOCKER_IMAGE_TAG]"
	echo
	echo "	Default tag is 'latest'."
	echo "	You can use several commands at once."
	echo
	echo "Example:"
	echo "	./build.sh build"
	echo "		this will build image $docker_image"
	echo
	echo "	./build.sh build tag v5"
	echo "		this will build image $docker_image_name:v5"
	echo
	echo "	./build.sh login push"
	echo "		this will log you in to dockerhub and push image $docker_image"
	echo
	echo
}

# parsing arguments

args=( "$@" )
cmds=()

for (( i=0; i<=${#args[@]}; i++ ))
do
  	if [ "${args[$i]}" = 'build' ] || [ "${args[$i]}" = 'push' ] || [ "${args[$i]}" = 'login' ]
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

if [ ${#cmds[@]} = 0 ]
	then
		usage
		exit 0
fi

for cmd in ${cmds[@]}
do
	$cmd
done
