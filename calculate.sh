#! /bin/bash

# 文件名：calculate.sh
# autor：Jasyn
# function: 简易计算器：接收2个数字实现加减乘除

# 用法：$(()) 双括号   $[] 方括号
echo "加法：$(( $1 + $2 ))"
echo "减法：$(( $1 - $2 ))"
echo "乘法：$(( $1 * $2 ))"
echo "除法：$(( $1 / $2 ))"
