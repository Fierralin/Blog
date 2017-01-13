#!/bin/bash

echo "./newpost [-p post_name] [-l layout] [-t tags] [-d description]"
echo Tip: tags must be "tag1 tag2 ..."
echo layout: post, default
echo comment: disqus, intensedebate, duoshuo

post_srcname="New Post"
layout="post"
tags=""
desc=""
comment_opt=""

while getopts n:l:t:d:c:h opt
do
	case "$opt" in
		n)  # post name
			post_srcname="$OPTARG"
			;;

		l)  # layout
			layout="$OPTARG"
			;;

		t)  # tags
			tags="$OPTARG"
			;;

		d)  # description
			desc="$OPTARG"
			;;

		c)  # comments
			comment_opt="$OPTARG"
			;;

		h)  # help
			echo "./newpost [-p post_name] [-l layout] [-t tags] [-d description]"
			echo Tip: tags must be "tag1 tag2 ..."
			echo layout: post, default
			echo comment: disqus, intensedebate, duoshuo
			exit 1
			;;

	esac
done

#echo $1
#echo $2
#echo $#

post_name=`date  "+%Y-%m-%d"`-`echo $post_srcname | sed "s/[ \/ : ^ \& \% \# \! , . { } ( ) * ? \" < > |]/-/g"`.md
#echo $post_name

post_name=`echo $post_name | sed 's/'"'"/-'/g'`
post_name=`echo $post_name | sed 's/-*-/-/g'`
post_name=`echo $post_name | sed 's/-\./\./g'`
#echo $post_name

file=./_posts/${post_name}
touch $file
echo --- > $file
echo layout: $layout >> $file
echo title: \"$post_srcname\" >> $file
echo date: `date "+%Y-%m-%d %H:%M:%S"` >> $file

if [ -n "$tags" ]; then
	echo tags: $tags >> $file
fi

if [ -n "$desc" ]; then
	echo description: $desc >> $file
fi

if [ -n "$comment_opt" ]; then
	if [ "$comment_opt" = "intensedebate" ]; then
		echo intensedebate: true >> $file
	elif [ "$comment_opt" = "disqus" ]; then
		echo disqus: true >> $file
	elif [ "$comment_opt" = "duoshuo" ]; then
		echo duoshuo: true >> $file
	fi
fi

echo --- >> $file

echo Successfully create $file

vim $file
