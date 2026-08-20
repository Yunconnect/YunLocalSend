# 云联局域网快传 V1.0

**云联局域网快传 V1.0** 是一款面向 Windows、Android 和 Linux 的局域网文件传输工具。设备连接到同一局域网后，可在无需云端中转的情况下安全传输文件、文件夹、文本和链接。

| 平台 | 发布形式 | 状态 |
|---|---|---|
| Windows x64 | 便携版 ZIP | 支持 |
| Android | ARM64、ARMv7、x86_64 APK | 支持 |
| Linux x64 | TAR.GZ 发布包 | 支持 |

## 主要功能

软件支持局域网设备发现、二维码连接、文件夹传输、文本与链接分享、接收目录设置、传输历史、收藏设备、PIN 确认和加密传输。所有用户可见的窗口标题、通知、提示、日志名称、系统菜单和三平台应用标识均统一使用“云联局域网快传 V1.0”。

## 云端编译

在 GitHub 仓库的 **Actions** 页面手动运行：

> **云联局域网快传 V1.0 - 三平台云编译**

流程会分别上传 Windows 便携版、Android 多架构 APK 和 Linux x64 发布包。

## 本地构建

项目固定使用 Flutter `3.41.9` 与稳定版 Rust 工具链。进入 `app` 目录后先执行 `flutter pub get`，再按目标平台运行 `flutter build windows --release`、`flutter build apk --release --split-per-abi` 或 `flutter build linux --release`。

## 许可说明

本项目基于 Apache-2.0 许可的软件进行 OEM 定制。根目录的 `LICENSE` 与发布资源中的许可说明文件均应随源码和发布包保留。
