#!/bin/sh


#same.shの機能

tmp=/tmp/$$


ERROR_EXIT(){
	echo "$1" 1>&2
	rm -r ${tmp}*
	exit 1 

}
#TEST1:in@ut args
echo "Plz input 2 argments" > ${tmp}-ans
./same.sh  2> ${tmp}-result && ERROR_EXIT "error in test1-1" #引数なし実行
diff $tmp-ans $tmp-result || ERROR_EXIT "error in test1-2"

./same.sh 1 2 3 2> ${tmp}-result && ERROR_EXIT "error in test1-4"
diff $tmp-ans $tmp-result || ERROR_EXIT "error in test1-4"



