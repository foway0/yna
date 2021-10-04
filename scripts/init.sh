#!/bin/bash

while getopts t:o: options
do
    case "${options}" in
        t) TARGET=${OPTARG};;
        o) OUTPUT=${OPTARG};;
    esac
done

mkdir -p $OUTPUT

pushd $OUTPUT >/dev/null 2>&1 || exit
while read -r line;
do
  echo "$line"
  url=$(echo "$line" | cut -d' ' -f1)
  branch=$(echo "$line" | cut -d' ' -f2)
  name=$(echo "$line" | cut -d' ' -f3)
  if [ -d "./${name}" ]
  then
    echo "SKIP... ${name} directory already exists"
  else
    echo "clone repositories"

    git clone ${url} ${name}

    git checkout ${branch}
  fi
done < $TARGET
popd $OUTPUT >/dev/null 2>&1 || exit