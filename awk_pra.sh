#! /bin/bash
# file: awk_pra.sh
# author:Jasyn
# function: 统计访问IP、筛选高使用率磁盘分区


echo "========================="


# 1. 统计访问IP

echo "1. 查看访问日志（前5行）"
head -5 access.log   # head：显示文件开头几行（默认前10行）


echo "----------------------"


echo "2. 统计每个IP的访问次数"
awk '{print $1}' access.log | sort | uniq -c | sort -rn    # $1:第一列  sort: 排序  uniq -c: 数次数  sort -rn:按数字倒序排列
echo "统计完成"


echo "-----------------------"


echo "3. 筛选高使用率磁盘分区"
echo "当前磁盘使用情况："
df -h   # df: 显示磁盘空间使用情况(系统命令，会实时读取当前系统的磁盘状态，怒需要任何日志文件)   -h: 用 GB、MB 等单位显示  输出列：文件系统，总大小，已用，可用，可使用率，挂载点


echo "先查看磁盘使用率大小"
df -h | awk '{print $5}'   # 有管道符：直接处理命令输出


echo "筛选使用率超过20%的分区"
df -h | awk '$5 > 20 {print $0}'   # $0: 整行全部信息


echo "筛选完成"
