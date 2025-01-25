#!/bin/bash

# 检查是否提供了端口参数
if [ "$#" -eq 0 ]; then
    echo "请提供至少一个端口作为参数。"
    exit 1
fi

# 定义一个函数来处理连接
handle_connection() {
    local port="$1"
    while true; do
        # 使用netcat监听指定的端口，并输出连接信息
        echo "正在监听端口: $port"
        
        # nc -l -p "$port" 会在收到连接时处理连接
        { echo "连接到端口 $port"; nc -l -p "$port"; } | while read line; do
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
