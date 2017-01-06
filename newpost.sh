#!/bin/bash

if [ $# -lt 2 ]; then
	echo "./newpost [post name] [layout] | [tags] [description]"
	echo Tip: tags must be "tag1 tag2 ..."
fi

#echo $1
#echo $2
#echo $#

post_name=`date  "+%Y-%m-%d"`-`echo $1 | sed "s/[ \/ : ^ \& \% \# \! , . { } ( ) * ? \" < > |]/-/g"`.md
#echo $post_name

post_name=`echo $post_name | sed 's/'"'"/-'/g'`
post_name=`echo $post_name | sed 's/-*-/-/g'`
post_name=`echo $post_name | sed 's/-\./\./g'`
#echo $post_name

file=./_posts/${post_name}
touch $file
echo --- > $file
echo layout: $2 >> $file
echo title: \"$1\" >> $file
echo date: `date "+%Y-%m-%d %H:%M:%S"` >> $file
if [ $# -ge 3 ]; then
	echo tags: $3 >> $file
fi
if [ $# -ge 4 ]; then
	echo description: $4 >> $file
fi
echo --- >> $file

echo Successfully create $file
