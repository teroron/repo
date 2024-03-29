#!/bin/sh



#引数が２つであること
#二つ引数が数値であること
#少なくとも一つ以上の引数が０以外であること。





 

#引数の数の確認
if [ $# -ne 2 ]; 
then 
     echo "引数は二つにして下さい"
     exit 1

fi   


#引数が数字かどうかの確認
imput_1=0
imput_2=0

	imput_1=$1
	imput_2=$2

expr $imput_1 + 1 > /dev/null 2>&1
RET_1=$?

if [ ! $RET_1 -lt 2 ]; then
   echo "一つ目の引数は不正です"

   exit 1
fi



expr $imput_2 + 1 > /dev/null 2>&1
RET_2=$?

if [ ! $RET_2 -lt 2 ]; then

     	echo "二つ目の引数は不正です"

    exit 1
fi


#最大公約数の定義確認（少なくとも一つが０では無いこと）

if [ $1 = 0 ] && [ $2 = 0 ]; then
        
	echo "少なくとも一方は０以外の正の整数にして下さい"
    
    exit 1

fi



#↓よくよく考えたら、最大公約数はマイナスも可なので、符号のチェックはなくした。
#引数の符号値か確認

#if [ $1 -lt 0 ]; then	
#	echo "不正"　
#    exit 1
#fi

#x=$(echo  "sqrt($2^2)") | bc

#if [[ $x  -nea $2 ]]; then
#        echo "引数を正の整数にして下さい"　
#   exit 1
#fi



#x=$(echo `expr \( $a \) \* \-1`)
#マイナスの値が入力された場合、うまく計算されないので、符号変換処理を入れようとしたけど、上手く行かなかった。


#最大公約数の計算
echo "最大公約数は" 
yes $1 $2 |
awk '{print $1/NR RS $2/NR}' | 
grep -Fv --line-buffered . |
awk 'a[$1]++{print;exit}'
echo "です！"

