#!/bin/bash





ERROR_EXIT(){
	echo "不一致" >&2
	rm -f /tmp/$$-*
       exit 1
}

#test1:引数が０個
result_1=$(./kadai3.sh)
echo "$result_1" > /tmp/$$-result
echo "引数は二つにして下さい"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test1 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result

#test1:引数が1個
result_2=$(./kadai3.sh 1)
echo "$result_2" > /tmp/$$-result
echo "引数は二つにして下さい"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test2 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result

#test1:引数が3個
result_3=$(./kadai3.sh 2 3 4)
echo "$result_3" > /tmp/$$-result
echo "引数は二つにして下さい"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test3 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result





#test4: 一つ目の引数が数字では無いケース
result_4=$(./kadai3.sh a 2)
echo "$result_4" > /tmp/$$-result
echo "一つ目の引数は数字ではありません"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test1 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result


#test5:二つ目の引数が数字では無いケース
result_5=$(./kadai3.sh 1 a)
echo "$result_5" > /tmp/$$-result
echo "二つ目の引数は数字ではありません"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test5 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result



#test6:最大公約数定義確認
result_6=$(./kadai3.sh 0 0)
echo "$result_6" > /tmp/$$-result
echo "少なくとも一方は０以外の正の整数にして下さい"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test6 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result





#test7:結果確認
result_7=$(./kadai3.sh 1617 273)
echo "$result_7" > /tmp/$$-result
echo "最大公約数は
21
です！"  > /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "test7 OK"  || ERROR_EXIT "result error"
rm /tmp/$$-ans /tmp/$$-result

