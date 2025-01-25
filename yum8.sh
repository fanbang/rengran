#!/usr/bin/env bash
exec 6<> /dev/tcp/localhost/25
if [ $? -eq 0 ]; then
    echo "25 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "25 端口无法使用"
fi
