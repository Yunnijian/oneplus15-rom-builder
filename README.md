# OnePlus 15 (PLK110) PixelOS 构建项目

## 项目概述
使用 GitHub Actions 自动化构建 PixelOS 14.0 for OnePlus 15 (PLK110)。

## 设备信息
- **型号**: OnePlus 15
- **代号**: PLK110
- **芯片组**: 骁龙 8 Gen 3
- **屏幕**: 6.78 英寸 AMOLED
- **电池**: 5500mAh

## 仓库配置
- **PixelOS 源码**: https://github.com/PixelOS-AOSP (分支: fourteen)
- **设备树**: https://github.com/OnePlus-SM8850-Development (分支: main)
- **内核源码**: https://github.com/OnePlus-SM8850-Development/android_device_oneplus_infiniti-kernel (分支: main)

## 项目结构
```
oneplus15-rom-builder/
├── .github/
│   └── workflows/
│       ├── build-pixelos-plk110.yml    # 主要 PixelOS 构建工作流
│       ├── build-existing-rom.yml      # 通用 ROM 构建工作流
│       └── build-rom.yml              # 基础 ROM 构建工作流
├── device/oneplus/plk110/             # 设备树示例文件
├── README.md                          # 项目概述
├── USAGE.md                           # 详细使用说明
└── PROJECT_SUMMARY.md                 # 项目总结
```

## 技术栈
- **ROM 基础**: PixelOS 14.0 (Android 14)
- **构建系统**: AOSP 构建系统
- **自动化**: GitHub Actions
- **缓存**: ccache 优化

## 构建状态
![Build PixelOS](https://github.com/Yunnijian/oneplus15-rom-builder/workflows/Build%20PixelOS%20for%20OnePlus%2015%20(PLK110)/badge.svg)

## 快速开始
1. Fork 本仓库
2. 进入 Actions 页面
3. 选择 "Build PixelOS for OnePlus 15 (PLK110)" 工作流
4. 点击 "Run workflow"
5. 选择构建变体 (userdebug/eng/user)
6. 等待构建完成 (预计 5-10 小时)
7. 下载构建的 PixelOS ROM

## 文档
- **[USAGE.md](USAGE.md)**: 详细使用说明
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**: 项目总结和技术细节

## 构建时间预估
- **首次构建**: 5-10 小时
- **后续构建**: 2-4 小时 (使用缓存)

## 贡献指南
欢迎贡献！请查看 GitHub Issues 和 Pull Requests。

## 许可证
本项目基于 GPLv3 许可证。