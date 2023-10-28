#!/bin/sh

cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/../../

MINT_FILE=Mintfile
MINT_DIR=Mints
MINT_DIR_LIB=lib
MINT_DIR_BIN=bin

mkdir -p $MINT_DIR/{$MINT_DIR_LIB,$MINT_DIR_BIN}

export MINT_PATH=$MINT_DIR/$MINT_DIR_LIB 
export MINT_LINK_PATH=$MINT_DIR/$MINT_DIR_BIN
export PATH=$PATH:$(pwd)/$MINT_DIR/$MINT_DIR_BIN