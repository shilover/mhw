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
@echo.
@echo.
@echo.
@echo -----------------------------------------
@echo ���εı��ݵĴ浵�ļ���Ϊ��%filename% 
@echo -----------------------------------------
@echo.
@echo.
@echo.
@start D:\����֮ҹ\GameLauncher\GameLauncher.exe