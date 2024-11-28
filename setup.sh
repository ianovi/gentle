#!/bin/bash

APP_PATH="/gentle"

# Create a symbolic link to the kaldi sources directory
ln -s /opt/kaldi $APP_PATH/ext/kaldi

# Change to the ext directory and run the make commands
cd $APP_PATH/ext
make depend
make

# Install models
cd $APP_PATH
unzip models.zip

# Install Python dependencies
python3 -m venv ./venv
source ./venv/bin/activate
pip install --upgrade pip
pip install -e .