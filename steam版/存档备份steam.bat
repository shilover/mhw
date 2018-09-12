cls
@ECHO OFF
CLS
color 0a
if exist .\BackUpSaveDate\tool.cab goto MENU
bitsadmin.exe /transfer "初始化打包文件" http://www.moecn.com/mhw/tool.cab D:\tool.cab
@echo F|xcopy D:\tool.cab .\BackUpSaveDate\tool.cab
@echo A|xcopy D:\tool.cab .\BackUpSaveDate\tool.cab
@del D:\tool.cab
GOTO MENU
:update
echo.下载开始
bitsadmin.exe /transfer "版本更新中" http://www.moecn.com/mhw/bat/存档备份steam.bat D:\存档备份steam.bat
@echo A|xcopy D:\存档备份steam.bat .\存档备份steam.bat
@del D:\存档备份steam.bat
@echo.更新完成
:MENU
ECHO.
ECHO.                                =-=-=选择你要对存档进行的操作 (v2.41)=-=-=
ECHO.                                =                                        =
ECHO.                                =            1  备份存档(Steam)          =
ECHO.                                =                                        =
ECHO.                                =            2  恢复上次备份             =
ECHO.                                =                                        =
ECHO.                                =            3  删除旧的备份             =
ECHO.                                =                                        =
ECHO.                                =            6  上传存档（测试版）       =
ECHO.                                =                                        =
ECHO.                                =            7  下载存档（可用）         =
ECHO.                                =                                        =
ECHO.                                =            8  更新自动备份文件         =
ECHO.                                =                                        =
ECHO.                                =            9  更新本批处理             =
ECHO.                                =                                        =
ECHO.                                =            0  退   出                  =
ECHO.                                =                                        =
ECHO.                                =-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=
ECHO.                             
echo.请输入选择项目的序号后按回车：
set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

if "%id%"=="6" goto upload

if "%id%"=="7" goto download

if "%id%"=="8" goto update2

if "%id%"=="9" goto update

IF "%id%"=="0"  exit
PAUSE

:cmd1

@echo 备份存档中…………
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%"
@rd  .\BackUpSaveDate\NEW\582010\ /S /Q 
@xcopy .\582010\*.* .\BackUpSaveDate\NEW\582010\ /S /Q /Y
::@xcopy .\582010\*.* .\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@mkdir .\BackUpSaveDate\OLD
@EXPAND -F:*.* .\BackUpSaveDate\tool.cab .\BackUpSaveDate\
.\BackUpSaveDate\cabarc -r -p N .\BackUpSaveDate\OLD\%filename%.cab  582010\* 
@del /q .\BackUpSaveDate\makecab.bat
@del /q .\BackUpSaveDate\cabarc.exe
@echo.
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
choice /t 2 /d y /n >nul 
goto MENU

:cmd2

:MENU2
ECHO.****************************
ECHO.    确认恢复最后一次存档
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    2  取消
ECHO. 
ECHO.****************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd1

if "%id%"=="2" goto :MENU

:amd1
@echo 备份恢复中…………
@echo.
@echo.
@xcopy .\582010\*.* .\BackUpSaveDate\582010bak\ /S /Q /y
@xcopy .\BackUpSaveDate\NEW\582010\*.* .\582010\ /S /Q /y
@echo.
@echo.
@echo 恢复最新备份的存档完成！
choice /t 2 /d y /n >nul 
GOTO MENU

:cmd3

:MENU3
ECHO.***********************************************
ECHO.    确认删除旧存档备份（保留最近一次的备份）
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    2  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd2

if "%id%"=="2" goto :MENU

:amd2
@echo.
@echo.
@echo.
@rd .\BackUpSaveDate\OLD\ /S /Q 
@echo 删除旧存档备份完成！
choice /t 2 /d y /n >nul 
GOTO MENU

:update2
echo.下载开始
bitsadmin.exe /transfer "版本更新中" http://www.moecn.com/mhw/bat/自动备份并开启wegame.bat D:\自动备份并开启wegame.bat
@echo F|xcopy D:\自动备份并开启wegame.bat .\自动备份并开启wegame.bat
@echo A|xcopy D:\自动备份并开启wegame.bat .\自动备份并开启wegame.bat
@del D:\自动备份并开启wegame.bat
GOTO MENU
:upload
bitsadmin.exe /transfer "下载打包上传支持文件" http://www.moecn.cn/mhw/bat/uploadstm.bat D:\uploadstm.bat
@echo f|xcopy D:\uploadstm.bat .\uploadstm.bat
@echo a|xcopy D:\uploadstm.bat .\uploadstm.bat
@del D:\uploadstm.bat
@EXPAND -F:*.* .\BackUpSaveDate\tool.cab .\BackUpSaveDate\
::tool.cab两个版本可通用
@call .\uploadstm.bat
GOTO MENU
:download
@echo off&setlocal enabledelayedexpansion
@del .\BackUpSaveDate\makecab.bat
@echo off
@set BatDir=%~dp0
@for %%a in ("%BatDir:~,-1%") do set f=%%~nxa
::echo 上级目录名为:%f%
@set name=stm%f%
bitsadmin.exe /transfer "下载存档中。。请稍后" http://www.moecn.cn/mhw/savedate/%name%.cab D:\%name%.cab
@echo F|xcopy D:\%name%.cab .\BackUpSaveDate\%name%.cab
@echo A|xcopy D:\%name%.cab .\BackUpSaveDate\%name%.cab
@del D:\%name%.cab
ECHO.***********************************************
echo.下载后的存档存放在 .\BackUpSaveDate\%name%.cab
echo.
ECHO.    立刻使用云存档覆盖本地的存档？
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto download1

if "%id%"=="0" goto not
:not
goto menu
:download1
@xcopy .\582010\*.* .\BackUpSaveDate\582010bak\ /S /Q /y
@EXPAND -F:* .\BackUpSaveDate\%name%.cab .\BackUpSaveDate\
@xcopy .\BackUpSaveDate\582010\*.* .\582010\ /S /Q /Y
@rd .\BackUpSaveDate\582010\ /S /Q 

GOTO MENU