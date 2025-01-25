#!/bin/bash

# 检查是否提供了端口参数
if [ "$#" -eq 0 ]; then
    echo "请提供至少一个端口作为参数。"
    exit 1
fi

# 遍历所有提供的端口参数
for port in "$@"; do
    echo "正在监听端口: $port"
    # 监听指定端口，并打印收到的消息
    nc -l -p "$port" -q 1 | while read line; do
        echo "收到消息: $line"
    done &
done

# 等待所有后台进程
wait
