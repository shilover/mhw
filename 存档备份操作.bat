cls
@ECHO OFF
CLS
color 0a

GOTO MENU
:MENU
ECHO.
ECHO.                                =-=-=-=-=ѡ����Ҫ�Դ浵���еĲ���=-=-=-=-=
ECHO.                                =                                        =
ECHO.                                =            1  ���ݴ浵                 =
ECHO.                                =                                        =
ECHO.                                =            2  �ָ��ϴα���             =
ECHO.                                =                                        =
ECHO.                                =            3  ɾ���ɵı���             =
ECHO.                                =                                        =
ECHO.                                =            4  ��   ��                  =
ECHO.                                =                                        =
ECHO.                                =-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=
ECHO.                             
echo.������ѡ����Ŀ����ź󰴻س���
set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

IF "%id%"=="4"  exit
PAUSE

:cmd1

@echo ���ݴ浵�С�������
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
@echo ������ɣ�
@echo -----------------------------------------
@echo ���εı��ݵĴ浵�ļ���Ϊ��%filename% 
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
goto MENU

:cmd2

:MENU2
ECHO.****************************
ECHO.    ȷ�ϻָ����һ�δ浵
ECHO.    
ECHO.    1  ȷ��
ECHO.    
ECHO.    2  ȡ��
ECHO. 
ECHO.****************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd1

if "%id%"=="2" goto :MENU

:amd1
@echo ���ݻָ��С�������
@echo.
@echo.
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\2000293bak\ /S /Q /y
@xcopy .\rail_user_data\BackUpSaveDate\NEW\2000293\*.* .\rail_user_data\2000293\ /S /Q /y
@echo.
@echo.
@echo �ָ����±��ݵĴ浵��ɣ�
choice /t 5 /d y /n >nul 
GOTO MENU

:cmd3

:MENU3
ECHO.***********************************************
ECHO.    ȷ��ɾ���ɴ浵���ݣ��������һ�εı��ݣ�
ECHO.    
ECHO.    1  ȷ��
ECHO.    
ECHO.    2  ȡ��
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
@echo ɾ���ɴ浵������ɣ�
choice /t 5 /d y /n >nul 
GOTO MENU