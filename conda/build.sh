#!/bin/bash

PKG_NAME="https-redirect"

QHOME=$PREFIX/q
mkdir -p $QHOME/packages/${PKG_NAME}
cp -r ${SRC_DIR}/${PKG_NAME}/*.q $QHOME/packages/${PKG_NAME}/
