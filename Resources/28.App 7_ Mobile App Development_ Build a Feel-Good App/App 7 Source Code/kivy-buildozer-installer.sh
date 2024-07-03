#!/bin/bash

# Install Python pip
sudo apt-get install -y curl
sudo apt-get install -y python3-distutils
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py

# Dependencies with SDL2
# Install necessary system packages
sudo apt-get install -y \
    python-pip \
    build-essential \
    git \
    python \
    python3-dev \
    ffmpeg \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev

# Dependencies Kivy
sudo pip3 install cython

# Install Kivy
sudo pip3 install kivy

# Dependencies Buildozer
sudo apt-get install -y \
    build-essential \
    ccache \
    git \
    libncurses5:i386 \
    libstdc++6:i386 \
    libgtk2.0-0:i386 \
    libpangox-1.0-0:i386 \
    libpangoxft-1.0-0:i386 \
    libidn11:i386 \
    python2.7 \
    python2.7-dev \
    openjdk-8-jdk \
    unzip \
    zlib1g-dev \
    zlib1g:i386 \
    libltdl-dev \
    libffi-dev \
    libssl-dev \
    autoconf \
    autotools-dev
    cmake

# Install Buildozer

# Cloning Buildozer repository directly to the HOME directory causes the
# AttributeError 'Namespace' object has no attribute 'ignore_setup_py' error when trying to build apk file.
# So Buildozer repository should be cloned to any directory except HOME
mkdir ~/buildozer-repo
cd ~/buildozer-repo

git clone https://github.com/kivy/buildozer.git
cd buildozer
sudo python3 setup.py install
