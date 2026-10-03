#!/bin/bash
set -e
pip install --user jupyter

JJAVA_VERSION="1.0-a5"   # à vérifier sur github.com/dflib/jjava/releases
curl -L -o /tmp/jjava.zip \
  "https://github.com/dflib/jjava/releases/download/${JJAVA_VERSION}/jjava-${JJAVA_VERSION}-kernelspec.zip"
unzip -o /tmp/jjava.zip -d /tmp/jjava
jupyter kernelspec install --user --name=jjava /tmp/jjava/*
