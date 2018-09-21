#!/bin/bash

venv=(
    $PWD/venv
    $PWD/VENV
    $PWD/.venv
    $PWD/.VENV
    /home/$USER/.virtualenv/${PWD##*/}
    /home/$USER/.virtualenvs/${PWD##*/}
)

if [[ ""$VIRTUAL_ENV"" == "" ]]
then
    for dir in ${venv[@]}
    do
        if [ -f $dir/bin/activate ]
        then
            echo "Found virtualenv in $dir"
            source $dir/bin/activate
            break
        fi
    done
else
    echo "Deactivating virtualenv..."
    deactivate
fi
