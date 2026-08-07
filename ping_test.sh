#! /bin/bash
# file: ping_test.sh
# author: Jasyn
# function: 简易循环ping主机脚本


# 定义要 ping 的主机列表
hosts=(
        "10.179.125.1"          # IPv4 网关
        "10.175.17.140"         # IPv4 DNS 服务器
        "10.179.125.67"         # 本机 IP 地址
        "8.8.8.8"               # Google DNS
        "114.114.114.114"       # 国内 DNS
        "www.baidu.com"         # 百度
        )

echo "======================="
echo "开始批量 ping 测试"
echo "======================="

for host in "${hosts[@]}";
do
        ping -c 1 -W 1 -q "$host" &>/dev/null
        if [ $? -eq 0 ]; then
                echo "$host - 可达"
        else
                echo "$host - 不可达"
        fi
done

echo ""
echo "======================="
echo "ping 测试完成"
echo "======================="
