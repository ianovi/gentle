FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive && apt update
RUN apt install -y zlib1g-dev automake git git-lfs libtool subversion libatlas3-base python3-pip python3-venv wget unzip ffmpeg sox gfortran

COPY . /gentle

RUN cd /gentle && git submodule init && git submodule update && git lfs pull

RUN cd /gentle/ext && ./install_kaldi.sh
RUN cd /gentle && unzip models.zip && rm models.zip
RUN cd /gentle/ext && make depend && make

RUN python3 -m pip install -e . && python3 -m pip install build service_identity && python3 -m build

EXPOSE 8765

VOLUME /gentle/webdata

CMD cd /gentle && python3 serve_ssl.py
