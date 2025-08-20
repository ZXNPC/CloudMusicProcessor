@echo off
setlocal enabledelayedexpansion

REM 加载配置文件
if exist "config.bat" (
    call "config.bat"
) else (
    echo 错误: 找不到配置文件 config.bat
    echo 请从 config_example.bat 创建 config.bat 并配置路径
    pause
    exit /b 1
)

REM 验证必要路径
if not exist "%NCMDump_PATH%" (
    echo 错误: 找不到 ncmdump.exe 在 %NCMDump_PATH%
    echo 请下载 ncmdump 并更新 config.bat 中的路径
    pause
    exit /b 1
)

REM 步骤1：执行ncmdump转换
echo [1/4] 正在转换ncm文件...
"%NCMDump_PATH%" -d "%VIP_SONGS_DIR%" -o "%OUTPUT_DIR%"
if %errorlevel% neq 0 (
    echo 转换过程中出现错误，请检查ncmdump是否正常工作
    pause
    exit /b 1
)

REM 步骤2：移动输出文件并清理
if exist "%OUTPUT_DIR%" (
    echo [2/4] 正在移动转换后的文件...
    
    if not exist "%SOURCE_DIR%" (
        mkdir "%SOURCE_DIR%"
    )
    
    for %%f in ("%OUTPUT_DIR%\*") do (
        if not exist "%SOURCE_DIR%\%%~nxf" (
            move "%%f" "%SOURCE_DIR%\"
        ) else (
            echo 跳过已存在的文件: %%~nxf
            del /f /q "%%f" 2>nul
        )
    )
    
    echo 正在强制删除临时文件夹...
    rd /s /q "%OUTPUT_DIR%" 2>nul
    if exist "%OUTPUT_DIR%" (
        echo 警告: 无法完全删除临时文件夹
    )
)

REM 步骤3：移动文件到备份目录
echo [3/4] 正在移动文件到备份目录...
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

for %%f in ("%SOURCE_DIR%\*") do (
    if not exist "%%f\" (
        echo "%%~af" | find "l" >nul
        if !errorlevel! equ 1 (
            if not exist "%BACKUP_DIR%\%%~nxf" (
                move "%%f" "%BACKUP_DIR%\"
            ) else (
                echo 备份目录中已存在: %%~nxf
                del /f /q "%%f" 2>nul
            )
        ) else (
            echo 跳过符号链接: %%~nxf
        )
    )
)

REM 步骤4：创建符号链接
echo [4/4] 正在创建符号链接...
if not exist "%SOURCE_DIR%" (
    mkdir "%SOURCE_DIR%"
)

for %%f in ("%BACKUP_DIR%\*") do (
    if not exist "%%f\" (
        set "target_file=%SOURCE_DIR%\%%~nxf"
        
        if not exist "!target_file!" (
            mklink "!target_file!" "%%f" >nul 2>&1
            if !errorlevel! equ 0 (
                echo 创建符号链接: %%~nxf
            ) else (
                echo 需要管理员权限创建符号链接: %%~nxf
            )
        ) else (
            (for /f "delims=" %%a in ('dir "!target_file!" /al 2^>nul ^| find "SYMLINK"') do set is_link=1) 2>nul
            if defined is_link (
                echo 符号链接已存在: %%~nxf
            ) else (
                echo 文件已存在: %%~nxf
            )
            set "is_link="
        )
    )
)

echo.
echo ? 所有操作完成！
echo 转换后的文件位置: %SOURCE_DIR%
echo 备份位置: %BACKUP_DIR%
pause