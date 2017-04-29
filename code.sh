#!/bin/sh

export GOPATH=$WORKSPACE
export XAUTHORITY=/.XAUTHORITY

/go/bin/gocode set package-lookup-mode go
/go/bin/gocode set autobuild true

mkdir -p $WORKSPACE/bin

WORKDIR=""

mkdir -p $WORKSPACE/.vscode
if [ ! -f $WORKSPACE/.vscode/settings.json ]; then
    cp /devhome/projectsettings.json $WORKSPACE/.vscode/settings.json
    # initialize workspace, so start vscode with this folder
    WORKDIR="-w $WORKSPACE"
fi

code --install-extension lukehoban.Go
code --install-extension haaaad.ansible
code --install-extension donjayamanne.githistory
code --install-extension PeterJausovec.vscode-docker 

cd $WORKSPACE
/usr/bin/code --verbose -p $WORKDIR
