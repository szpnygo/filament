#!/bin/bash

# 定义要查找的文件名
libraries=(
    filament
    backend
    math
    utils
    filaflat
    filabridge
    ibl-lite
    bluevk
    smol-v
    camutils
    ibl
    gltfio
    gltfio_core
    dracodec
    meshoptimizer
    filamat
    zstd
    uberzlib
    stb
    vkshaders
    image
    basis_transcoder
    filament-iblprefilter
    filameshio
    geometry
    ktxreader
    mikktspace
    shaders
    uberarchive
)

# 设置源目录和目标目录
source_dir="out/ohos"
destination_dir="out/release"

# 限定查找的子目录
search_dirs=(
    "$source_dir/filament"
    "$source_dir/libs"
    "$source_dir/shaders"
)

# 确保目标目录存在
mkdir -p "$destination_dir"

# 遍历每个库名称，查找并复制文件
for lib in "${libraries[@]}"; do
    for dir in "${search_dirs[@]}"; do
        # 查找指定目录中的所有 .a 文件并复制到目标目录
        find "$dir" -type f -name "*${lib}*.a" -exec cp {} "$destination_dir" \;
    done
done

echo "所有库文件已复制到 $destination_dir"
