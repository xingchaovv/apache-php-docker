#!/bin/bash
publisher=xingchaovv
image=apache-php-docker

workDir=$(dirname "$0")
tag=$1; if [ -z "$tag" ]; then echo "Usage: run.sh TAG MODE"; exit 1; fi
dockerDir=$workDir/$tag; if [ ! -d "$dockerDir" ]; then echo "The directory of TAG not existed."; exit 1; fi

mode=$2; if [ -z "$mode" ]; then echo "Usage: run.sh TAG MODE"; exit 1; fi
if [ "$mode" != "apache" ] && [ "$mode" != "bash" ]; then
  echo "MODE: apache|bash"
  exit 1
fi

imageFullPath=$publisher/$image:$tag
container="$image"_"$tag"

cmd="sudo docker stop $container"; echo "$cmd"; $cmd
cmd="sudo docker rm $container"; echo "$cmd"; $cmd

tailCmd=$imageFullPath
if [ "$mode" = "bash" ]; then
  tailCmd="-it --entrypoint /bin/bash $imageFullPath"
fi

cmd="sudo docker run --name $container
-v $PWD/$tag/test_www:/var/www/html
-v $PWD/$tag/test_conf/php.ini:/usr/local/etc/php/php.ini
-p 8081:80
-e RUN_UID=501 -e RUN_GID=20
$tailCmd
"
echo "$cmd"; $cmd
