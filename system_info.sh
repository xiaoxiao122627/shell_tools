#! /bin/bash

# ------------------------------------

# file: system_info.sh
# author: Jasyn
# function: 收集主机基础信息（主机名、系统版本、内存、磁盘使用率等）


# 设置时区
export TZ='Asia/Shanghai'

# 添加日志功能
LOG_FILE="./system_info.log"

log() {
    echo "$1" | tee -a "$LOG_FILE"
}

log "==============================="
log "主机基础信息报告"
log "报告生成时间 $(date +"%Y-%m-%d %H:%M:%S")"
log "=============================="

log "主机名： $(hostname)"

log "系统版本："
cat /etc/os-release | head -n 3 | tee -a "$LOG_FILE"

log "内存使用情况："
free -h | tee -a "$LOG_FILE"

log "磁盘使用情况："
df -h | tee -a "$LOG_FILE"

log "当前登录用户： $(whoami)"

log "系统运行时间: $(uptime)"

log "==============================="
log "报告生成完毕"
