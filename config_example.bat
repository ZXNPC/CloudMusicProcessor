@echo off
REM ============ CloudMusicProcessor 配置 ============
REM 请根据您的实际路径修改这些配置

REM ncmdump.exe 的路径
set "NCMDump_PATH=D:\Downloads\ncmdump.exe"

REM 源目录（CloudMusic主目录）
set "SOURCE_DIR=D:\Downloads\CloudMusic"

REM VIP歌曲下载目录
set "VIP_SONGS_DIR=D:\Downloads\CloudMusic\VipSongsDownload"

REM 转换输出临时目录
set "OUTPUT_DIR=D:\Downloads\CloudMusic\output"

REM 备份目录
set "BACKUP_DIR=Z:\我的备份\Music"

REM ============ 高级配置（可选）============
REM 设置日志文件路径
set "LOG_FILE=%SOURCE_DIR%\processing.log"

REM 设置是否启用详细日志 (true/false)
set "VERBOSE_LOGGING=false"