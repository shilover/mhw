cls
@ECHO OFF
CLS
color 0a
GOTO MENU
:update
echo.下载开始
bitsadmin.exe /transfer "版本更新中" http://www.moecn.com/mhw/bat/存档备份wegame.bat D:\存档备份wegame.bat
@echo A|xcopy D:\存档备份wegame.bat .\存档备份wegame.bat
@del D:\存档备份wegame.bat
bitsadmin.exe /transfer "下载存档压缩工具" http://www.moecn.com/mhw/tool.cab D:\tool.cab
@echo F|xcopy D:\tool.cab .\rail_user_data\BackUpSaveDate\tool.cab
@echo A|xcopy D:\tool.cab .\rail_user_data\BackUpSaveDate\tool.cab
@del D:\tool.cab
@echo.更新完成
:MENU
ECHO.
ECHO.                                =-=-=选择你要对存档进行的操作 (v2.4 )=-=-=
ECHO.                                =                                        =
ECHO.                                =            1  备份存档wegame           =
ECHO.                                =                                        =
ECHO.                                =            2  恢复上次备份             =
ECHO.                                =                                        =
ECHO.                                =            3  删除旧的备份             =
ECHO.                                =                                        =
ECHO.                                =            4  备份并安装MOD            =
ECHO.                                =                                        =
ECHO.                                =            5  卸载MOD                  =
ECHO.                                =                                        =
ECHO.                                =            6  上传存档（测试版）       =
ECHO.                                =                                        =
ECHO.                                =            7  下载存档                 =
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

if "%id%"=="4" goto mod1

if "%id%"=="5" goto mod2

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
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
::@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@EXPAND -F:*.* .\rail_user_data\BackUpSaveDate\tool.cab .\rail_user_data\BackUpSaveDate\
.\rail_user_data\BackUpSaveDate\cabarc -r -p N .\rail_user_data\BackUpSaveDate\OLD\%filename%.cab  .\rail_user_data\2000293\* 
@del /q .\rail_user_data\BackUpSaveDate\makecab.bat
@del /q .\rail_user_data\BackUpSaveDate\cabarc.exe
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
choice /t 2 /d y /n >nul 
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
choice /t 2 /d y /n >nul 
GOTO MENU


:mod1
:MENU41
ECHO.***********************************************
ECHO.    选择下面的操作（使用mod存在风险，请查看更新log2.3）
ECHO.      
ECHO.    1  一键下载并安装mod包(首次使用请选我)
ECHO. 
ECHO.    8  手动下载mod包（下载后的cab文件需手动放入MHWMODWG文件夹内）
ECHO. 
ECHO.    9  手动选择安装mod（手动下载mod包或之前成功通过一键安装过后使用）
ECHO. 
ECHO.    0  取消
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto down1

if "%id%"=="8"  goto baiduyun

if "%id%"=="9"  goto mod11

if "%id%"=="0" goto :MENU

:baiduyun
@echo 网盘文件说明
@echo bin.cab         mod控制文件（必要）
@echo MOD01.cab       丝瓜mod    （可选）
start https://pan.baidu.com/s/1N3q5-BO36DHA8uVg36qdXQ
@pause
GOTO MENU41

:down1
@mkdir .\MHWMODWG
bitsadmin.exe /transfer "下载mod控制文件，若速度较慢请使用网盘下载" http://www.moecn.com/mhw/bin.cab D:\bin.cab
@echo f|xcopy D:\bin.cab .\MHWMODWG\bin.cab
@echo a|xcopy D:\bin.cab .\MHWMODWG\bin.cab
@del D:\bin.cab

@echo 初始化完成
:MENU411
ECHO.***********************************************
ECHO.    选择希望下载并立刻安装的mod（若下载速度较慢请查看“MHWMODWG网盘地址”这个文件）
ECHO.      
ECHO.    1  丝瓜mod（大小：204.84M   来源/署名：群友/未知）
ECHO. 
ECHO.    2  cpu减负mod
ECHO. 
ECHO.    0  返回
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto down11

if "%id%"=="2"  goto down12

if "%id%"=="0" goto :MENU41

:down11
bitsadmin.exe /transfer "下载丝瓜mod，若速度较慢请使用网盘下载" http://208.167.253.6/mhw/MOD01.cab D:\MOD01.cab 
@del .\MHWMODWG\MOD01.cab
@echo f|xcopy D:\MOD01.cab  .\MHWMODWG\MOD01.cab
@del D:\MOD01.cab
@echo.下载完成。
GOTO mod111

:down12
@echo.请等待近期更新
GOTO mod112



:mod11

:MENU412
ECHO.***********************************************
ECHO.    选择希望安装的mod（自行网盘下载mod包或之前成功通过一键安装过后使用）
ECHO.      
ECHO.    1  丝瓜mod
ECHO. 
ECHO.    2  cpu减负mod
ECHO. 
ECHO.    0  返回
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod111

if "%id%"=="2"  goto mod112

if "%id%"=="0" goto :MENU41

:mod111
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
@mkdir .\MHWMODWG\bin
@EXPAND -F:*.* .\MHWMODWG\bin.cab .\MHWMODWG\bin\
@call .\MHWMODWG\bin\install01.bat
@rd .\MHWMODWG\bin\ /S /Q 
@echo -----------------------------------------
@echo 已安装丝瓜mod
@echo -----------------------------------------
choice /t 2 /d y /n >nul 
GOTO MENU411

:mod112
@echo.请等待近期更新
GOTO MENU411


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
@mkdir .\MHWMODWG\bin
@EXPAND -F:*.* .\MHWMODWG\bin.cab .\MHWMODWG\bin\
@call .\MHWMODWG\bin\uninstall01.bat
@rd .\MHWMODWG\bin\ /S /Q 
@echo -----------------------------------------
@echo 已卸载丝瓜mod
@echo -----------------------------------------
choice /t 2 /d y /n >nul 

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
choice /t 2 /d y /n >nul 
GOTO MENU42

:update2
echo.下载开始
bitsadmin.exe /transfer "版本更新中" http://www.moecn.com/mhw/bat/自动备份并开启wegame.bat D:\自动备份并开启wegame.bat
@echo A|xcopy D:\自动备份并开启wegame.bat .\自动备份并开启wegame.bat
@del D:\自动备份并开启wegame.bat
GOTO MENU
:upload
bitsadmin.exe /transfer "下载打包上传支持文件" http://www.moecn.cn/mhw/bat/uploadwg.bat D:\uploadwg.bat
@echo f|xcopy D:\uploadwg.bat .\rail_user_data\BackUpSaveDate\uploadwg.bat
@echo a|xcopy D:\uploadwg.bat .\rail_user_data\BackUpSaveDate\uploadwg.bat
@del D:\uploadwg.bat
@EXPAND -F:*.* .\rail_user_data\BackUpSaveDate\tool.cab .\rail_user_data\BackUpSaveDate\
::tool.cab两个版本可通用
@call .\rail_user_data\BackUpSaveDate\uploadwg.bat
GOTO MENU
:download

@echo 半夜4点太困了，下回更新此功能

GOTO MENU