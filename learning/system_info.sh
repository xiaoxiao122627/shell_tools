#! /bin/bash
# file: system_info.sh
# author: Jasyn
# function:主机基础信息收集脚本（主机名、系统版本、内存、磁盘使用率）



# 设置时区
export TZ='Asia/Shanghai'


echo "==============================="
echo "主机基础信息报告"
echo "报告生成时间 $(date +"%Y-%M-%d %H:%M:%S")"

echo "=============================="

# 1. 主机名
echo "主机名： $(hostname)"

# 2. 系统版本
echo "系统版本："
cat /etc/os-release | head -n 3

# 3. 内存使用情况
echo "内存使用情况："
free -h

# 4. 磁盘使用情况
echo "磁盘使用情况："
df -h

# 5. 当前登录用户
echo "当前登录用户： $(whoami)"

# 6. 系统运行时间
echo "系统运行时间: $(uptime)"


echo "==============================="
echo "报告生成完毕"
