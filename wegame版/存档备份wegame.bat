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
ECHO.                                =            4  退   出                  =
ECHO.                                =                                        =
ECHO.                                =-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=
ECHO.                             
echo.请输入选择项目的序号后按回车：
set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

IF "%id%"=="4"  exit
PAUSE

:cmd1

@echo 备份存档中…………
@echo.
@echo.
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\BackUpSaveDate\NEW\*.* .\rail_user_data\BackUpSaveDate\OLD\ /S /Q /Y
@rd  .\rail_user_data\BackUpSaveDate\NEW\ /S /Q 
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%"
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\%filename%\ /S /Q /Y
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
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\2000293bak\ /S /Q /y
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
@rd .\rail_user_data\BackUpSaveDate\OLD\ /S /Q 
@echo 删除旧存档备份完成！
choice /t 5 /d y /n >nul 
GOTO MENU