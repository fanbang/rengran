#!/bin/bash

# 检查是否提供了端口参数
if [ "$#" -eq 0 ]; then
    echo "请提供至少一个端口作为参数。"
    exit 1
fi

# 定义一个函数来处理连接
handle_connection() {
    local port="$1"
    echo "正在监听端口: $port"
    
    # 使用netcat监听指定的端口
    while true; do
        # nc -lk会保持连接，-k使得tc能够持续接受新连接
        { echo "连接到端口 $port"; nc -lk "$port"; } | while read line; do
            echo "收到连接: $line"
        done
    done
}

# 遍历所有提供的端口参数
for port in "$@"; do
    handle_connection "$port" &
done

# 等待所有后台进程完成
wait
