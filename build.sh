#!/bin/bash
publisher=xingchaovv
image=apache-php-docker

workDir=$(dirname "$0")
tag=$1; if [ -z "$tag" ]; then echo "Usage: build.sh TAG"; exit 1; fi
dockerDir=$workDir/$tag; if [ ! -d "$dockerDir" ]; then echo "The directory of TAG not existed."; exit 1; fi
dockerFile=$dockerDir/Dockerfile

imageFullPath=$publisher/$image:$tag

cmd="sudo docker build -t $imageFullPath -f $dockerFile ."; echo "$cmd"; $cmd
