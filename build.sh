#!/bin/bash

AUTOM=(`git diff HEAD~ HEAD --name-only | grep "\/"`)

error() {
    if [ $? != 0 ]; then
        echo "Error!"
        exit 122
    fi
}

tag() {
    docker tag ${1} $(echo $DOCKER_USERNAME)/${1}
}

build() {
    docker build -t ${1} .
}

push() {
    docker push $(echo $DOCKER_USERNAME)/${1}
}

clean() {
    FROM=$1
    arrIN=(${FROM///*/ })
    echo $arrIN
}

for autom in ${AUTOM[@]}; do
    CLEANED+=("$(clean ${autom})")
done

AUTOM=($(printf "%s\n" "${CLEANED[@]}" | sort -u | tr '\n' ' '))

for autom in ${AUTOM[@]}; do
    echo "=> Building ${autom}"
    cd ${autom}
    error
    build ${autom}
    error
    tag ${autom}
    error
    push ${autom}
    error
    cd ..
    echo
done

exit 0
