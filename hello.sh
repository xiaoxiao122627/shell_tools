#! /bin/bash

# 文件名：hello.sh
# author: Jasyn
# function: 交互式脚本：接收输入姓名并打印问候语

# read：交互式输入
read -p "我的名字是：" name        # 语法: read -p "提示语" 变量名  （提示信息和变量名之间有空格）  # 先显示提示，再把输入存到 name
echo "$name"                 # 再输出变量

echo "hello, ${name}"
