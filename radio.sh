#!/bin/bash

set -eu
SAVEPATH=~/radio
URIXML=$(echo "cat /rss/channel/item/enclosure/@url" |xmllint --shell http://www.nhk.or.jp/r-news/podcast/nhkradionews.xml)
URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
while [ "${URL}" != "/ >" ]
  do
    wget -nc -P ${SAVEPATH} ${URL}
    URIXML=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"[^\"]*\"\(.*$\)/\1/"`
    URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
  done
