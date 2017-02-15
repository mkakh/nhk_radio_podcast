#!/bin/bash

set -eu
SAVEPATH=~/radio
URIXML=$(echo "cat /rss/channel/item/enclosure/@url" |xmllint --shell http://www.nhk.or.jp/r-news/podcast/nhkradionews.xml)
URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
URLS=${URL}
while [ "${URL}" != "/ >" ]
  do
    URIXML=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"[^\"]*\"\(.*$\)/\1/"`
    URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
    URLS="${URLS} ${URL}"
  done

  echo ${URLS%\/ >} | xargs -n 1 -P `nproc` wget -nc -P ${SAVEPATH}
