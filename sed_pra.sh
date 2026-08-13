#! /bin/bash
# file: sed_pra.sh
# author:Jasyn
# function: 批量修改配置、清理空行和注释行


file="app.conf"
file_original="${file}.original" 	# 定义一个原始文件

# 检查配置文件是否存在
if [ ! -f "$file" ]; then
	echo "错误：配置文件 $file 不存在"
	exit 1
fi


echo "----------------------"


echo "1. 查看原始配置文件"
cat -n "$file"		# -n:显示行号


echo "----------------------"


echo "2. 备份原始文件（即保留一份从未改动的文件）"
cp "$file" "$file_original"	# cp: copy 复制
echo "已备份到 $file_original 文件中"


echo "-----------------------"



echo "3. 清理空行和注释行"

# 方式1：
sed -i '/^$/d' "$file" | sed '/^#/d'   # -i:直接修改文件  ^$:空行  d:delete 删除  ^#:以注释开头的行   /^$/d: 匹配行进行删除


echo '========================'


# 方式2：
sed -i -E '/^$|^#/d' "$file"  # sed -E: 正则表达式   |：或

echo "已删除空行和注释行"


echo "-----------------------"


echo "4. 批量修改配置参数"
sed -e 's/8080/9090/g' -e 's/MAX_CONNECTIONS=100/MAX_CONNECTIONS=500/g' "$file" -i  	# -e:多次编辑，可执行多个命令
echo "已修改配置文件"


echo "-----------------------"


echo "5. 查看修改后的配置文件"
echo "$file"
cat -n "$file"


echo "--------------------------"
echo "修改完成"
echo "原始文件 $file_original 未改动"
echo "修改后的文件：$file"
