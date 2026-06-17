# OnePlus 15 (PLK110) PixelOS 构建使用说明

## 项目概述

本项目使用 GitHub Actions 自动化构建 PixelOS 14.0 for OnePlus 15 (PLK110)。

### 仓库配置
- **PixelOS 源码**: https://github.com/PixelOS-AOSP (分支: fourteen)
- **设备树**: https://github.com/OnePlus-SM8850-Development (分支: main)
- **内核源码**: https://github.com/OnePlus-SM8850-Development/android_device_oneplus_infiniti-kernel (分支: main)

## 快速开始

### 1. Fork 仓库
```bash
# Fork 本仓库到你的 GitHub 账户
# 然后克隆到本地
git clone https://github.com/你的用户名/oneplus15-rom-builder.git
cd oneplus15-rom-builder
```

### 2. 触发构建

#### 方式一: 手动触发 (推荐)
1. 进入仓库的 Actions 页面
2. 选择 "Build PixelOS for OnePlus 15 (PLK110)" 工作流
3. 点击 "Run workflow"
4. 填写参数:
   - **构建变体**: 选择 userdebug, eng 或 user
   - **是否清理构建**: 选择是否清理之前的构建缓存
5. 点击 "Run workflow" 开始构建

#### 方式二: 自动触发
当你向 `main` 或 `develop` 分支推送代码时，会自动触发构建。

### 3. 监控构建进度
1. 在 Actions 页面查看构建状态
2. 点击正在运行的工作流查看详情
3. 每个步骤都有详细的日志输出

### 4. 下载构建产物
构建完成后:
1. 在 Actions 页面找到成功的工作流运行
2. 点击 "Artifacts" 下载 PixelOS 文件
3. 或者查看 Releases 页面下载发布版本

## 工作流说明

### 工作流文件: `build-pixelos-plk110.yml`

#### 主要步骤:
1. **check-inputs**: 检查输入参数和配置
2. **setup-build-env**: 设置构建环境和依赖
3. **sync-pixelos**: 同步 PixelOS 源码
4. **add-device-tree**: 添加设备树和内核源码
5. **build-pixelos**: 构建 PixelOS
6. **test-pixelos**: 测试构建结果
7. **create-release**: 创建发布版本
8. **cleanup**: 清理构建环境
9. **notify**: 发送构建通知

#### 特性:
- ✅ 自动化构建流程
- ✅ 支持多种构建变体
- ✅ 缓存优化，加速重复构建
- ✅ 详细的构建日志
- ✅ 自动测试和验证
- ✅ 自动创建 GitHub Release
- ✅ 支持手动和自动触发

## 构建时间预估

| 阶段 | 预计时间 | 说明 |
|------|----------|------|
| 环境设置 | 5-10 分钟 | 安装依赖和配置 |
| 源码同步 | 1-2 小时 | 同步 PixelOS 源码 |
| 设备树添加 | 5-10 分钟 | 克隆设备树和内核 |
| 构建 | 4-8 小时 | 编译 ROM |
| 测试 | 10-15 分钟 | 验证构建结果 |
| **总计** | **5-10 小时** | 首次构建可能更长 |

## 常见问题

### Q: 构建失败怎么办？
A: 检查以下几点:
1. 查看构建日志中的具体错误信息
2. 确认设备树仓库是否正确
3. 确认内核源码是否完整
4. 检查 PixelOS 源码分支是否兼容

### Q: 如何自定义构建？
A: 你可以:
1. 修改 `.github/workflows/build-pixelos-plk110.yml` 文件
2. 添加自定义补丁到 `patches/` 目录
3. 修改设备树中的配置文件

### Q: 构建需要多长时间？
A: 首次构建可能需要 5-10 小时，具体取决于:
1. GitHub Actions 的运行时间限制
2. 网络速度（同步源码）
3. 设备树的复杂程度

### Q: 如何更新设备树或内核？
A: 1. 更新设备树仓库
   2. 更新内核仓库
   3. 重新触发构建

### Q: 如何添加自定义功能？
A: 1. Fork 设备树仓库
   2. 添加自定义补丁
   3. 更新工作流中的仓库地址

## 高级配置

### 1. 修改仓库地址
在工作流文件中修改环境变量:

```yaml
env:
  PIXELOS_REPO: https://github.com/你的PixelOS仓库
  PIXELOS_BRANCH: 你的分支
  DEVICE_TREE_REPO: https://github.com/你的设备树仓库
  DEVICE_TREE_BRANCH: 你的分支
  KERNEL_REPO: https://github.com/你的内核仓库
  KERNEL_BRANCH: 你的分支
```

### 2. 添加自定义补丁
将补丁文件放在 `patches/` 目录中，工作流会自动应用:

```yaml
- name: 应用补丁
  run: |
    cd ${{ github.workspace }}/pixelos-build
    for patch in ${{ github.workspace }}/patches/*.patch; do
      git apply "$patch"
    done
```

### 3. 配置 ccache
为了加速构建，可以配置 ccache:

```yaml
- name: 设置 ccache
  run: |
    export USE_CCACHE=1
    export CCACHE_DIR=${{ github.workspace }}/.ccache
    ccache -M 50G
```

### 4. 使用 Docker 镜像
在工作流中可以使用预构建的 Docker 镜像来加速构建:

```yaml
container:
  image: lineageos4docker/lineageos:latest
```

## 技术支持

如果遇到问题:
1. 查看 GitHub Issues
2. 搜索相关错误信息
3. 参考 PixelOS 官方文档
4. 在相关论坛寻求帮助

## 注意事项

1. **构建时间**: GitHub Actions 有运行时间限制，首次构建可能需要优化
2. **存储空间**: ROM 源码和构建产物需要大量存储空间
3. **网络限制**: 同步 ROM 源码可能受到 GitHub 网络限制
4. **设备兼容性**: 确保设备树与 ROM 源码版本兼容
5. **法律合规**: 确保你有权使用和分发相关代码

## 更新日志

### v1.1.0 (PixelOS 版本)
- 支持 PixelOS 14.0 构建
- 集成 OnePlus-SM8850-Development 设备树
- 集成 OnePlus-SM8850-Development 内核源码
- 优化构建流程和缓存策略
- 添加详细的构建信息记录

### v1.0.0 (初始版本)
- 支持 LineageOS, PixelExperience, crDroid, ArrowOS
- 自动化构建流程
- 支持手动和自动触发
- 详细的构建日志和错误处理