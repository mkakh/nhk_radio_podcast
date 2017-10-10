#!/bin/bash

set -eu

SAVEPATH=~/radio

# nprocをして出た値を入力。コマンドがなかったときは4に設定。
NPROC=8

XML=$(curl http://www.nhk.or.jp/r-news/podcast/nhkradionews.xml 2>/dev/null)
URLS=$(echo $XML | grep -Eo '(http|https)[^"]+mp3')
echo $URLS | xargs -n 1 -P $NPROC wget -nc -P $SAVEPATH
