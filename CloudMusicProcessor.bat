@echo off
setlocal enabledelayedexpansion

REM ���������ļ�
if exist "config.bat" (
    call "config.bat"
) else (
    echo ����: �Ҳ��������ļ� config.bat
    echo ��� config_example.bat ���� config.bat ������·��
    pause
    exit /b 1
)

REM ��֤��Ҫ·��
if not exist "%NCMDump_PATH%" (
    echo ����: �Ҳ��� ncmdump.exe �� %NCMDump_PATH%
    echo ������ ncmdump ������ config.bat �е�·��
    pause
    exit /b 1
)

REM ����1��ִ��ncmdumpת��
echo [1/4] ����ת��ncm�ļ�...
"%NCMDump_PATH%" -d "%VIP_SONGS_DIR%" -o "%OUTPUT_DIR%"
if %errorlevel% neq 0 (
    echo ת�������г��ִ�������ncmdump�Ƿ���������
    pause
    exit /b 1
)

REM ����2���ƶ�����ļ�������
if exist "%OUTPUT_DIR%" (
    echo [2/4] �����ƶ�ת������ļ�...
    
    if not exist "%SOURCE_DIR%" (
        mkdir "%SOURCE_DIR%"
    )
    
    for %%f in ("%OUTPUT_DIR%\*") do (
        if not exist "%SOURCE_DIR%\%%~nxf" (
            move "%%f" "%SOURCE_DIR%\"
        ) else (
            echo �����Ѵ��ڵ��ļ�: %%~nxf
            del /f /q "%%f" 2>nul
        )
    )
    
    echo ����ǿ��ɾ����ʱ�ļ���...
    rd /s /q "%OUTPUT_DIR%" 2>nul
    if exist "%OUTPUT_DIR%" (
        echo ����: �޷���ȫɾ����ʱ�ļ���
    )
)

REM ����3���ƶ��ļ�������Ŀ¼
echo [3/4] �����ƶ��ļ�������Ŀ¼...
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
                echo ����Ŀ¼���Ѵ���: %%~nxf
                del /f /q "%%f" 2>nul
            )
        ) else (
            echo ������������: %%~nxf
        )
    )
)

REM ����4��������������
echo [4/4] ���ڴ�����������...
if not exist "%SOURCE_DIR%" (
    mkdir "%SOURCE_DIR%"
)

for %%f in ("%BACKUP_DIR%\*") do (
    if not exist "%%f\" (
        set "target_file=%SOURCE_DIR%\%%~nxf"
        
        if not exist "!target_file!" (
            mklink "!target_file!" "%%f" >nul 2>&1
            if !errorlevel! equ 0 (
                echo ������������: %%~nxf
            ) else (
                echo ��Ҫ����ԱȨ�޴�����������: %%~nxf
            )
        ) else (
            (for /f "delims=" %%a in ('dir "!target_file!" /al 2^>nul ^| find "SYMLINK"') do set is_link=1) 2>nul
            if defined is_link (
                echo ���������Ѵ���: %%~nxf
            ) else (
                echo �ļ��Ѵ���: %%~nxf
            )
            set "is_link="
        )
    )
)

echo.
echo ? ���в�����ɣ�
echo ת������ļ�λ��: %SOURCE_DIR%
echo ����λ��: %BACKUP_DIR%
pause