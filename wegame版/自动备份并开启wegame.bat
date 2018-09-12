cls
@ECHO OFF
CLS
color 0a
::if not "%~1"=="p" start /min cmd.exe /c %0 p&exit
::把上面语句前面的冒号去掉即可以最小化运行，避免鼠误点导致的批处理执行暂停
set gamepath=F:\Progra~1\WeGame\tgp_daemon.exe
@echo -----------------------------------------
@echo. 1若提示找不到文件，右键编辑“本文件”
@echo. 2在记事本中修改上面set gamepath=后地址为你的wegame启动器地址
@echo. 3注意需保留start，并且Program Files使用Progra~1代替
@echo. 4建议生成本文件的快捷方式，并将快捷方式放到自己觉得方便的地方使用
@echo -----------------------------------------
@echo.
@echo.
@echo.
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
@echo.正在开启wegame，请稍等………… 关闭wegame时将自动进行存档备份
@echo.
@echo.
@echo ！！请不要用鼠标玩弄本窗口，会暂停本批处理的执行，如误点，可按空格可恢复执行！！
@start /wait %gamepath%
@echo.
@echo.
@echo 备份开始！
@set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
@set sec=%TIME:~3,2%%TIME:~6,2%
@Set h=%TIME:~0,2%
@If %h% leq 9 (Set h=0%h:~1,1%)
@set hhmiss=%h%%sec%
@set "filename=%YYYYmmdd%_%hhmiss%"
@rd  .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q 
@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\NEW\2000293\ /S /Q /Y
::@xcopy .\rail_user_data\2000293\*.* .\rail_user_data\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@mkdir .\rail_user_data\BackUpSaveDate\OLD
@EXPAND -F:*.* .\rail_user_data\BackUpSaveDate\tool.cab .\rail_user_data\BackUpSaveDate\
.\rail_user_data\BackUpSaveDate\cabarc -r -p N .\rail_user_data\BackUpSaveDate\OLD\%filename%.cab  .\rail_user_data\2000293\* 
@del .\rail_user_data\BackUpSaveDate\makecab.bat
@del /q .\rail_user_data\BackUpSaveDate\cabarc.exe
@echo.
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
@echo.
:MENU
@ECHO.
@ECHO.                                =-=-=-是否需要上传存档文件到服务器？-=-=-=
@ECHO.                                =                                        =
@ECHO.                                =            1  上传（测试版）           =
@ECHO.                                =                                        =
@ECHO.                                =            2  不用                     =
@ECHO.                                =                                        =
@ECHO.                                =-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=
@echo.请输入选择项目的序号后按回车：
@set /p  ID=
@if "%id%"=="1"  goto cmd1

@if "%id%"=="2" goto cmd2
:cmd1
bitsadmin.exe /transfer "下载打包上传支持文件" http://www.moecn.cn/mhw/bat/uploadwg.bat D:\uploadwg.bat
@echo f|xcopy D:\uploadwg.bat .\rail_user_data\BackUpSaveDate\uploadwg.bat
@echo a|xcopy D:\uploadwg.bat .\rail_user_data\BackUpSaveDate\uploadwg.bat
@del D:\uploadwg.bat
@EXPAND -F:*.* .\rail_user_data\BackUpSaveDate\tool.cab .\rail_user_data\BackUpSaveDate\
::tool.cab两个版本可通用
@call .\rail_user_data\BackUpSaveDate\uploadwg.bat
:cmd2
@echo 10秒后会关闭此窗口
@choice /t 10 /d y /n >nul 


