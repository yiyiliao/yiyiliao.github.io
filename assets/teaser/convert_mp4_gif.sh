#!/bin/bash

# 检查是否提供了输入文件
if [ $# -ne 1 ]; then
    echo "Usage: $0 input.mp4"
    exit 1
fi

# 获取输入文件名和输出文件名
input_video="$1"
output_gif="${input_video%.*}.gif"

# 使用 ffmpeg 转换 .mp4 到 .gif
ffmpeg -i "$input_video" -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "$output_gif"

echo "Conversion complete: $output_gif"
