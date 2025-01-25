#!/bin/bash

# 检查是否提供了端口参数
if [ "$#" -eq 0 ]; then
    echo "请提供至少一个端口作为参数。"
    exit 1
fi

# 遍历所有提供的端口参数
for port in "$@"; do
    echo "正在监听端口: $port"
    # 使用 netcat 监听指定的端口
    while true; do
        # 等待连接，如果有连接则处理
        { 
            # 打印连接消息
            echo "连接到端口 $port" 
            # 等待输入并打印收到的消息
            nc -l -p "$port" -q 1 
        } | while read line; do
            [[ -n "$line" ]] && echo "收到消息: $line"
        done
    done &
done

# 等待所有后台进程
wait
