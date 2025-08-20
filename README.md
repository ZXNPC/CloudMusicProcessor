# CloudMusic Processor

一个用于自动处理网易云音乐NCM格式文件的Windows批处理脚本。

> 🤖 本项目由 [DeepSeek](https://www.deepseek.com) AI 辅助生成

## 🚀 功能特性

- ✅ 自动转换NCM格式为普通音频格式
- ✅ 文件去重和智能移动
- ✅ 自动备份到指定目录
- ✅ 创建符号链接保持文件访问
- ✅ 支持多次运行，智能跳过已处理文件

## 📦 所需工具

- [ncmdump](https://github.com/yoki123/ncmdump) - NCM文件转换工具
- Windows系统（支持符号链接）

## ⚙️ 安装配置

1. **下载ncmdump**
   ```bash
   # 从GitHub下载最新版ncmdump
   # 或使用包管理器
   scoop install ncmdump
   ```

2. **配置路径**
   - 复制 `config_example.bat` 为 `config.bat`
   - 修改配置文件中的路径为您的实际路径

3. **运行脚本**
   ```cmd
   CloudMusicProcessor.bat
   ```

## 🛠️ 配置文件说明

编辑 `config.bat`：

```bat
set "NCMDump_PATH=D:\Tools\ncmdump.exe"
set "SOURCE_DIR=D:\CloudMusic"
set "VIP_SONGS_DIR=D:\CloudMusic\VipSongs"
set "BACKUP_DIR=E:\MusicBackup"
```

## 📋 使用流程

1. 在网易云音乐下载VIP歌曲到 `VIP_SONGS_DIR`
2. 运行本脚本
3. 脚本会自动：
   - 转换NCM文件
   - 备份到指定目录
   - 创建符号链接

## ❓ 常见问题

**Q: 需要管理员权限吗？**  
A: 只有在创建符号链接时需要管理员权限。

**Q: 支持哪些音频格式？**  
A: 取决于ncmdump，通常支持mp3、flac等格式。

**Q: 如何查看处理日志？**  
A: 启用 `VERBOSE_LOGGING=true` 并设置 `LOG_FILE` 路径。

## 🎯 项目背景

本项目由 [DeepSeek](https://www.deepseek.com) AI 辅助开发，旨在自动化处理网易云音乐的NCM格式文件，提供便捷的音乐文件管理解决方案。

**AI辅助开发说明：**
- 脚本逻辑和架构由DeepSeek AI设计
- 代码经过人工审核和优化
- 支持批量处理和错误恢复机制
- 提供完整的配置化和文档

## 📄 许可证

MIT License - 详见 LICENSE 文件

## 🤝 贡献

欢迎提交Issue和Pull Request！

---

<div align="center">

**Powered by** [DeepSeek](https://www.deepseek.com) | **特殊感谢** ncmdump 项目

</div>