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
ECHO.                                =            4  ���ݲ���װMOD            =
ECHO.                                =                                        =
ECHO.                                =            5  ж��MOD                  =
ECHO.                                =                                        =
ECHO.                                =            0  ��   ��                  =
ECHO.                                =                                        =
ECHO.                                =-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=
ECHO.                             
echo.������ѡ����Ŀ����ź󰴻س���
set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

if "%id%"=="4" goto mod1

if "%id%"=="5" goto mod2

IF "%id%"=="0"  exit
PAUSE

:cmd1

@echo ���ݴ浵�С�������
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
ECHO.    0  ȡ��
ECHO. 
ECHO.****************************
echo.
set /p  ID=
if "%id%"=="1"  goto amd1

if "%id%"=="0" goto :MENU

:amd1
@echo ���ݻָ��С�������
@echo.
@echo.
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\2000293bak\ /S /Q /y
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
ECHO.    0  ȡ��
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
@echo ɾ���ɴ浵������ɣ�
choice /t 5 /d y /n >nul 
GOTO MENU


:mod1
:MENU41
ECHO.***********************************************
ECHO.    ѡ������Ĳ�����������mod����
ECHO.    
ECHO.    1  �״�ʹ��ǰ��ѡ������mod��
ECHO.  
ECHO.    2  ���ݴ浵����װ˿��mod
ECHO. 
ECHO.    9  ���ݴ浵����װ����ȫ��mod
ECHO. 
ECHO.    0  ȡ��
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto down1

if "%id%"=="2"  goto mod11

if "%id%"=="9"  goto mod19

if "%id%"=="0" goto :MENU

:down1
echo.���ؿ�ʼ
bitsadmin.exe /transfer "�����У����ٶȽ�����ʹ�������������ӣ�https://pan.baidu.com/s/1Y85E3rTRoUeXhEOUr3SGyQ ���룺xr0k" http://www.moecn.com/download/MHWMODWG.zip D:\MHWMODWG.zip
@echo f|xcopy D:\MHWMODWG.zip .\MHWMODWG.zip
@del D:\MHWMODWG.zip
@echo.������ɣ����Ҽ�����MHWMODWG.zipѡ���ѹ����ǰ�ļ���
@echo.ȷ����MHWMODWG���ļ��У��롰�������� ����(2000293)���ļ����Լ�����������ͬһĿ¼
@echo.�ҡ�MHWMODWG���ļ�����ֱ�ӿɼ�binĿ¼
choice /t 5 /d y /n >nul 
@pause
GOTO MENU41

:mod11
@echo ���ݴ浵�С�������
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%˿��modǰ"
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\MOD\%filename%\ /S /Q /Y
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
@echo.
@echo.
@echo ������ɣ�
@echo -----------------------------------------
@echo ���εı��ݵĴ浵�ļ���Ϊ��%filename% 
@echo -----------------------------------------
@echo. 
@echo ���������ʼ��װ˿��mod
@pause
@call .\MHWMODWG\bin\install01.bat
@echo -----------------------------------------
@echo �Ѱ�װ˿��mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
GOTO MENU41



:mod19
@echo ���ݴ浵�С�������
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%ȫ��modǰ"
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\MOD\%filename%\ /S /Q /Y
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
@echo.
@echo.
@echo ������ɣ�
@echo -----------------------------------------
@echo ���εı��ݵĴ浵�ļ���Ϊ��%filename% 
@echo -----------------------------------------
@echo.
@echo ���������ʼ��װȫ��mod
@pause
@xcopy ".\MHWMOD\MOD01\*.*" ".\�������� ����(2000293)\nativePC\" /S /Q /Y /E
@echo -----------------------------------------
@echo �Ѱ�װȫ��mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 
GOTO MENU41

:mod2
:MENU42
ECHO.***********************************************
ECHO.    ѡ������Ĳ���
ECHO.    
ECHO.    1  ж��˿��mod
ECHO. 
ECHO.    9  ж������ȫ��mod
ECHO.
ECHO.    0  ȡ��
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod21

if "%id%"=="9"  goto mod29

if "%id%"=="0" goto :MENU

:mod21

ECHO.***********************************************
ECHO.    ȷ��ɾ��˿�ϵ�MODô��������Ѿ����˿��װ����ж�ؿ��ܵ�����Ϸ������
ECHO.    
ECHO.    1  ȷ��
ECHO.    
ECHO.    0  ȡ��
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod211

if "%id%"=="0" goto :MENU42

:mod211

@call .\MHWMODWG\bin\uninstall01.bat
@echo -----------------------------------------
@echo ��ж��˿��mod
@echo -----------------------------------------
choice /t 5 /d y /n >nul 

GOTO MENU42
:mod29

:MENU429
ECHO.***********************************************
ECHO.    ȷ��ɾ��ȫ����MODô��������Ѿ����MODװ����ж�ؿ��ܵ�����Ϸ������
ECHO.    
ECHO.    1  ȷ��
ECHO.    
ECHO.    0  ȡ��
ECHO. 
ECHO.***********************************************
echo.
set /p  ID=
if "%id%"=="1"  goto mod291

if "%id%"=="0" goto :MENU42

:mod291

@rd  ".\�������� ����(2000293)\nativePC\" /S /Q 
@echo.
@echo ��ж��ȫ��mod
choice /t 5 /d y /n >nul 
GOTO MENU42