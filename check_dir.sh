#! /bin/bash

# 文件名: check_dir.sh
# author: Jasyn
# function: 文件检测脚本：目录不存在则自动创建

# 1. 接收用户输入的目录路径
read -p "请输入要检测的路径：" dir_path

# 2. 判断路径是否存在
if [ -d "$dir_path" ]; then         # -d：测试是否为目录  "$dir_path"：变量值，用双引号包起来防止空格或空值导致语法错误
        # 存在
        echo "目录 '$dir_path' 已存在"
else
        # 不存在
        echo "目录 '$dir_path' 不存在，正在创建……"
        mkdir -p "$dir_path"    # -p: 自动创建路径中所有缺失的父目录
        # 如果 dir_path 是 /a/b/c，mkdir -p 会先创建 /a，再创建 /a/b，最后创建 /a/b/c；如果不用 -p，而 /a 不存在，就会报错
        # 创建成功 → 返回 0；失败 → 返回非 0
        
        
        # 3. 检查创建是否成功
        if [ $? -eq 0 ]; then     # $?:特殊变量，保存上一条命令的退出状态码
                echo "目录创建成功"
        else
                echo "目录创建失败，请检查权限"
        fi
fi
