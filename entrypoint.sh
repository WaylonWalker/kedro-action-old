#!/bin/bash

install_python_version(){
	pyenv install $INPUT_PYTHON_VERSION
	pyenv global $INPUT_PYTHON_VERSION
}


install_kedro(){
    python -m pip install --upgrade pip
    pip install kedro
}

install_project(){
    kedro install
}

lint(){
    if [ $INPUT_SHOULD_LINT ]; then
        kedro lint
    fi
}

install_python_version
install_kedro
install_project
lint