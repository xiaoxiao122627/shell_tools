#! /bin/bash
# file: menu.sh
# author: Jasyn
# function: case菜单脚本：查看磁盘、内存、退出

while true;      # 无限循环，条件永远为真
do
        clear   # 清屏，让菜单每次显示在干净页面上

        # 显示菜单
        echo "==============================="
        echo "系统信息菜单"
        echo "==============================="
        echo "1. 查看磁盘使用情况"
        echo "2. 查看内存使用情况"
        echo "3. 查看系统运行时间"
        echo "4. 退出"
        echo "================================"



        # 读取用户选择
        read -p "请输入选项 [1-4]:" choice

        # 根据用户选择执行对应操作
        case $choice in
        1)
            echo ""
            echo "----- 磁盘使用情况 -----"
            df -h    # 查看磁盘使用情况（-h 人类可读格式）
            echo ""
            read -p "按 Enter 键返回菜单...";;
            
        2)
            echo ""
            echo "----- 内存使用情况 -----"
            free -h    # 查看内存使用情况（-h 人类可读格式）
            echo ""
            read -p "按 Enter 键返回菜单...";;
            
        3)
            echo ""
            echo "----- 系统运行时间 -----"
            uptime    # 显示系统运行时间、登录用户数、系统负载
            echo ""
            read -p "按 Enter 键返回菜单...";;
            
        4)
            echo ""
            echo "再见！感谢使用！"
            exit 0;;     # 退出脚本，返回成功状态码 0
            
        *)
            echo ""
            echo "❌ 无效选项，请输入 1-4"
            sleep 1;;    # 等待 1 秒，让用户看到错误提示后再显示菜单
            
    esac
done
