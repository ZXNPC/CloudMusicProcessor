# CloudMusic Processor

一个用于自动处理网易云音乐NCM格式文件的Windows批处理脚本。

> 🤖 本项目由 [DeepSeek](https://www.deepseek.com) AI 辅助生成

## 🎯 解决痛点

**你是否遇到这样的问题？**
- 🎵 想要将网易云音乐下载到NAS进行备份和集中管理
- 🔄 但又担心移动文件后，网易云客户端会重新下载已处理过的文件
- 💾 需要在本地保留访问权限，同时实现NAS备份

**CloudMusic Processor 完美解决这个问题！**

通过智能的符号链接技术，本脚本让您可以：
- ✅ **安全备份**: 将转换后的音乐文件自动移动到NAS
- ✅ **无缝访问**: 在本地目录创建符号链接，网易云客户端无感知
- ✅ **避免重复**: 防止网易云重复下载已处理的VIP歌曲
- ✅ **双重保障**: 既享受NAS存储优势，又保持本地使用体验

## 🚀 核心功能

- 🔄 **自动转换**: 批量处理NCM格式为通用音频格式
- 📦 **智能备份**: 自动移动文件到NAS指定目录
- 🔗 **符号链接**: 在本地创建透明访问链接
- ⚡ **去重保护**: 智能跳过已处理文件，避免重复操作
- 🛡️ **错误恢复**: 完善的错误处理和日志记录

## 📦 所需工具

- [ncmdump](https://github.com/taurusxin/ncmdump) - NCM文件转换工具（推荐使用此版本）
- Windows系统（支持符号链接）
- NAS网络存储设备（可选，但推荐）

## ⚙️ 安装配置

1. **下载ncmdump**
   ```bash
   # 从GitHub下载最新版ncmdump
   # 推荐使用: https://github.com/taurusxin/ncmdump
   # 下载后放置到指定目录
   ```

2. **配置NAS路径**
   ```bat
   REM 在 config.bat 中设置NAS备份路径
   set "BACKUP_DIR=\\你的NAS\音乐库\网易云音乐"
   ```

3. **配置ncmdump路径**
   ```bat
   set "NCMDump_PATH=D:\Tools\ncmdump.exe"
   ```

4. **运行脚本**
   ```cmd
   CloudMusicProcessor.bat
   ```

## 🏗️ 工作原理

```
网易云下载 → NCM文件 → 转换处理 → 移动至NAS → 创建符号链接 → 本地无感访问
```

**优势对比**：
| 方案       | NAS备份 | 本地访问 | 避免重复下载 |
| ---------- | ------- | -------- | ------------ |
| 直接移动   | ✅       | ❌        | ❌            |
| 手动复制   | ✅       | ✅        | ❌            |
| **本脚本** | ✅       | ✅        | ✅            |

## 🛠️ 配置文件说明

编辑 `config.bat` 设置相关路径：

```bat
REM ncmdump工具路径（必需）
set "NCMDump_PATH=D:\Tools\ncmdump.exe"

REM NAS网络路径（推荐）
set "BACKUP_DIR=\\NAS_IP\Music\CloudMusic"

REM 本地工作目录
set "SOURCE_DIR=D:\CloudMusic"
set "VIP_SONGS_DIR=D:\CloudMusic\VipSongsDownload"
```

## 📋 使用流程

1. 从 [ncmdump](https://github.com/taurusxin/ncmdump) 下载转换工具
2. 网易云音乐下载VIP歌曲到指定目录
3. 配置脚本路径参数
4. 运行本脚本一次处理所有文件
5. 享受：
   - 🎵 NAS上的安全音乐备份
   - 💻 本地目录的无缝访问
   - 🔄 避免网易云重复下载的烦恼

## ❓ 常见问题

**Q: 在哪里下载ncmdump？**  
A: 推荐使用 [taurusxin/ncmdump](https://github.com/taurusxin/ncmdump)，该版本维护较好。

**Q: 符号链接会影响网易云客户端的正常使用吗？**  
A: 完全不会！符号链接对应用程序是透明的，网易云客户端无法区分链接和真实文件。

**Q: NAS连接中断怎么办？**  
A: 脚本会检测网络路径可用性，如果NAS不可访问会暂停操作并提示。

## 🎯 适用场景

- 🏠 **家庭媒体中心**: 将音乐集中存储到NAS
- 💾 **磁盘空间优化**: 本地只保留链接，节省空间
- 🔄 **多设备同步**: NAS音乐库多设备共享
- 🛡️ **数据安全**: 重要音乐文件NAS备份

## 📄 许可证

MIT License - 详见 LICENSE 文件

## 🤝 贡献

欢迎提交Issue和Pull Request！

---

<div align="center">

**NAS音乐管理最佳实践** | **Powered by** [DeepSeek](https://www.deepseek.com)

</div>