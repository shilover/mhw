@echo ���ݴ浵�С�������
@echo.
@echo.
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%"
@rd  .\BackUpSaveDate\NEW\582010\ /S /Q 
@xcopy .\582010\*.* .\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@xcopy .\582010\*.* .\BackUpSaveDate\NEW\582010\ /S /Q /Y
@echo.
@echo.
@echo ������ɣ�
@echo -----------------------------------------
@echo ���εı��ݵĴ浵�ļ���Ϊ��%filename% 
@echo -----------------------------------------
@start ..\..\Steam.exe
