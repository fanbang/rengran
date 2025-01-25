#!/bin/bash

# 检查是否提供了端口参数
if [ "$#" -eq 0 ]; then
    echo "请提供至少一个端口作为参数。"
    exit 1
fi

# 遍历所有提供的端口参数
for port in "$@"; do
    # 使用netcat监听指定的端口
    echo "正在监听端口: $port"
    nc -l "$port" &
done

# 等待所有后台进程完成
wait
