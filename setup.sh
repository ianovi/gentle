#!/bin/bash

# create symbolic link to the kaldi directory (link /gentle/ext/kaldi to source /opt/kaldi
ln -s /opt/kaldi /gentle/ext/kaldi
cd ext && make depend && make

# install models
#cd ..
#&& git lfs pull && unzip models.zip
# && rm models.zip

# install python dependencies
cd /gentle && python3 -m venv /venv && source /venv/bin/activate && pip install --upgrade pip \
&& pip install -e .
# && pip install build service_identity && python -m build
