﻿@echo 备份存档中…………
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
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
start ..\..\Steam.exe
@echo -----------------------------------------
@echo. 1若提示找不到文件，右键编辑“本文件”
@echo. 2在记事本中修改上面的地址为你的steam启动器地址
@echo. 3注意需保留start，并且Program Files使用Progra~1代替
@echo -----------------------------------------
@pause