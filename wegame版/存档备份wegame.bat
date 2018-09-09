cls
@ECHO OFF
CLS
color 0a

GOTO MENU
:MENU
ECHO.
ECHO.                                =-=-=-=-=选择你要对存档进行的操作=-=-=-=-=
ECHO.                                =                                        =
ECHO.                                =            1  备份存档                 =
ECHO.                                =                                        =
ECHO.                                =            2  恢复上次备份             =
ECHO.                                =                                        =
ECHO.                                =            3  删除旧的备份             =
ECHO.                                =                                        =
ECHO.                                =            4  备份并安装MOD            =
ECHO.                                =                                        =
ECHO.                                =            5  卸载MOD                  =
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

if "%id%"=="4" goto mod1

if "%id%"=="5" goto mod2

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
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
@echo.
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
goto MENU

:cmd2

:MENU2
ECHO.****************************
ECHO.    确认恢复最后一次存档
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    0  取消
ECHO. 
ECHO.****************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd1

if "%id%"=="0" goto :MENU

:amd1
@echo 备份恢复中…………
@echo.
@echo.
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\2000293bak\ /S /Q /y
@xcopy .\rail_user_data\BackUpSaveDate\NEW\2000293\*.* .\rail_user_data\2000293\ /S /Q /y
@echo.
@echo.
@echo 恢复最新备份的存档完成！
choice /t 5 /d y /n >nul 
GOTO MENU

:cmd3

:MENU3
ECHO.***********************************************
ECHO.    确认删除旧存档备份（保留最近一次的备份）
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd2

if "%id%"=="0" goto :MENU

:amd2
@echo.
@echo.
@echo.
@rd .\rail_user_data\BackUpSaveDate\OLD\ /S /Q 
@echo 删除旧存档备份完成！
choice /t 5 /d y /n >nul 
GOTO MENU


:mod1
:MENU41
ECHO.***********************************************
ECHO.    选择下面的操作（需下载mod包，使用mod存在风险，请查看更新log2.3）
ECHO.    
ECHO.    1  首次使用前请选我下载mod包（若下载速度过慢请用附带的网盘链接下载）
ECHO.  
ECHO.    2  备份存档并安装丝瓜mod
ECHO. 
ECHO.    9  备份存档并安装以上全部mod
ECHO. 
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto down1

if "%id%"=="2"  goto mod11

if "%id%"=="9"  goto mod19

if "%id%"=="0" goto :MENU

:down1
echo.下载开始
bitsadmin.exe /transfer "下载中，若速度较慢请使用网盘下载" http://www.moecn.com/download/MHWMODWG.zip D:\MHWMODWG.zip
@echo f|xcopy D:\MHWMODWG.zip .\MHWMODWG.zip
@del D:\MHWMODWG.zip
@echo.下载完成，请右键单击MHWMODWG.zip选择解压到当前文件夹
@echo.确保“MHWMODWG”文件夹，与“怪物猎人 世界(2000293)”文件夹以及本批处理在同一目录
@echo.且“MHWMODWG”文件夹内直接可见bin目录
choice /t 5 /d y /n >nul 
@pause
GOTO MENU41

:mod11
@echo 备份存档中…………
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%丝瓜mod前"
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\MOD\%filename%\ /S /Q /Y
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
@echo.
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
@echo. 
@echo 按任意键开始安装丝瓜mod
@pause
@call .\MHWMODWG\bin\install01.bat
@echo -----------------------------------------
@echo 已安装丝瓜mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
GOTO MENU41



:mod19
@echo 备份存档中…………
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%全部mod前"
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\MOD\%filename%\ /S /Q /Y
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
@echo.
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
@echo.
@echo 按任意键开始安装全部mod
@pause
@xcopy ".\MHWMOD\MOD01\*.*" ".\怪物猎人 世界(2000293)\nativePC\" /S /Q /Y /E
@echo -----------------------------------------
@echo 已安装全部mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
GOTO MENU41

:mod2
:MENU42
ECHO.***********************************************
ECHO.    选择下面的操作
ECHO.    
ECHO.    1  卸载丝瓜mod
ECHO. 
ECHO.    9  卸载以上全部mod
ECHO.
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod21

if "%id%"=="9"  goto mod29

if "%id%"=="0" goto :MENU

:mod21

ECHO.***********************************************
ECHO.    确认删除丝瓜的MOD么？如果你已经获得丝瓜装备，卸载可能导致游戏出错！！
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod211

if "%id%"=="0" goto :MENU42

:mod211

@call .\MHWMODWG\bin\uninstall01.bat
@echo -----------------------------------------
@echo 已卸载丝瓜mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 

GOTO MENU42
:mod29

:MENU429
ECHO.***********************************************
ECHO.    确认删除全部的MOD么？如果你已经获得MOD装备，卸载可能导致游戏出错！！
ECHO.    
ECHO.    1  确认
ECHO.    
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod291

if "%id%"=="0" goto :MENU42

:mod291

@rd  ".\怪物猎人 世界(2000293)\nativePC\" /S /Q 
@echo.
@echo 已卸载全部mod
choice /t 5 /d y /n >nul 
GOTO MENU42