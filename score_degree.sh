#! /bin/bash

# 文件名：score_degree.sh
# author: Jasyn
# function: if实现成绩等级判断脚本

# 1. 接收用户输入
read -p "请输入成绩（0~100）：" score

# 2. 判断是否合法（0-100之间的数字）
if ! [[ "$score" =~ ^[0-9]+$ ]]; then        #  在 Bash 脚本中，优先用 [[ ]]，它更安全、更强大、更方便。只有在必须兼容 /bin/sh 时才用 [ ]    
 # 整个字符串从头到尾必须是数字，且至少1位
        echo "错误：请输入纯数字"
        exit 1       # 主动退出脚本并返回一个状态码   用户输入不合法，立即退出脚本，返回 1 表示失败
fi

if [ $score -lt 0 ] || [ $score -gt 100 ]; then
        echo "错误：成绩必须在0-100之间"
        exit 1
fi


# 3. 等级判断
if [ $score -ge 80 ]; then
        echo "成绩优秀"
elif [ $score -ge 70 ]; then
        echo "成绩良好"
elif [ $score -ge 60 ]; then
        echo "成绩及格"
else
        echo "成绩不合格"
fi
