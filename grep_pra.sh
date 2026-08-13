#! /bin/bash
# file: grep_pra.sh
# author: Jasyn
# function: 过滤错误日志，剔除空行和注释行

file="app.log"


# 检查日志文件是否存在
if [ ! -f "$file" ]; then
	echo "错误：日志文件 $file 不存在"
	exit 1
fi

echo "==================="
echo "1. 过滤错误日志"

grep -i 'error' "$file"  # grep语法： grep [options] [pattern] [file]  -i:不区分大小写


echo "==================="
echo "2. 剔除空行、注释行"

# 方式1(组合过滤)：
grep -v '^$' "$file" | grep -v '^#'  # -v：剔除  ^$:空行   $#:注释开头的


echo "========================="

	
# 方式2(使用扩展正则)：
grep -E -v '^$|^#' "$file"	  # grep -E：使用扩展正则 |: 管道符
