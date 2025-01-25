#!/usr/bin/env bash
exec 6<> /dev/tcp/localhost/80
if [ $? -eq 0 ]; then
    echo "80 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "80 端口无法使用"
fi
exec 6<> /dev/tcp/localhost/465
if [ $? -eq 0 ]; then
    echo "465 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "465 端口无法使用"
fi
exec 6<> /dev/tcp/localhost/143
if [ $? -eq 0 ]; then
    echo "143 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "143 端口无法使用"
fi
exec 6<> /dev/tcp/localhost/587
if [ $? -eq 0 ]; then
    echo "587 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "587 端口无法使用"
fi
exec 6<> /dev/tcp/localhost/25
if [ $? -eq 0 ]; then
    echo "25 端口可以使用"
    exec 6<&-  # 关闭输入
    exec 6>&-  # 关闭输出
else
    echo "25 端口无法使用"
fi
