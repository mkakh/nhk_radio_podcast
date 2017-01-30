#!/bin/bash

SAVEPATH=~/radio/japanese
if [ ! -e ${SAVEPATH} ]
then
  mkdir -p ${SAVEPATH}/old
fi
if ls ${SAVEPATH}/*.mp3 > /dev/null 2>&1
then
  mv -v ${SAVEPATH}/*.mp3 ${SAVEPATH}/old/
fi
URIXML=$(echo "cat /rss/channel/item/enclosure/@url" |xmllint --shell http://www.nhk.or.jp/r-news/podcast/nhkradionews.xml)
URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
wget -nc -P ${SAVEPATH} ${URL}

SAVEPATH=~/radio/english
if [ ! -e ${SAVEPATH} ]
then
  mkdir -p ${SAVEPATH}/old
fi
if ls ${SAVEPATH}/*.mp3 > /dev/null 2>&1
then
  mv -v ${SAVEPATH}/*.mp3 ${SAVEPATH}/old/
fi
URIXML=$(echo "cat /rss/channel/item/enclosure/@url" |xmllint --shell http://www3.nhk.or.jp/rj/podcast/rss/english.xml)
URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
wget -nc -P ${SAVEPATH} ${URL}

SAVEPATH=~/radio/russian
if [ ! -e ${SAVEPATH} ]
then
  mkdir -p ${SAVEPATH}/old
fi
if ls ${SAVEPATH}/*.mp3 > /dev/null 2>&1
then
  mv -v ${SAVEPATH}/*.mp3 ${SAVEPATH}/old/
fi
URIXML=$(echo "cat /rss/channel/item/enclosure/@url" |xmllint --shell http://www3.nhk.or.jp/rj/podcast/rss/russian.xml)
URL=`echo ${URIXML} | sed -e "s/^[^\"]*url=\"\([^\"]*\)\".*$/\1/"`
wget -nc -P ${SAVEPATH} ${URL}


