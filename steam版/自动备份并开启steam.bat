cls
@ECHO OFF
CLS
color 0a
::if not "%~1"=="p" start /min cmd.exe /c %0 p&exit
::把上面语句前面的冒号去掉即可以最小化运行，避免鼠误点导致的批处理执行暂停
set gamepath=.\..\..\Steam.exe
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
@rd  .\BackUpSaveDate\NEW\582010\ /S /Q 
@xcopy .\582010\*.* .\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@xcopy .\582010\*.* .\BackUpSaveDate\NEW\582010\ /S /Q /Y
@echo.正在开启steam，请稍等………… 关闭steam时将自动进行存档备份时将自动进行存档备份
@echo.
@echo.
@echo ！！请不要用鼠标玩弄本窗口，会暂停本批处理的执行，如误点，可按空格可恢复执行！！
@start /wait %gamepath%
@echo.
@echo.
if exist .\BackUpSaveDate\tool.cab goto backup
bitsadmin.exe /transfer "初始化打包文件" http://www.moecn.com/mhw/tool.cab D:\tool.cab
@echo F|xcopy D:\tool.cab .\BackUpSaveDate\tool.cab
@echo A|xcopy D:\tool.cab .\BackUpSaveDate\tool.cab
@del D:\tool.cab
:backup
@echo 备份开始！
@rd  .\BackUpSaveDate\NEW\582010\ /S /Q 
@xcopy .\582010\*.* .\BackUpSaveDate\NEW\582010\ /S /Q /Y
::@xcopy .\582010\*.* .\BackUpSaveDate\OLD\%filename%\ /S /Q /Y
@mkdir .\BackUpSaveDate\OLD
@EXPAND -F:*.* .\BackUpSaveDate\tool.cab .\BackUpSaveDate\
.\BackUpSaveDate\cabarc -r -p N .\BackUpSaveDate\OLD\%filename%.cab  .\582010\* 
@del /q .\BackUpSaveDate\makecab.bat
@del /q .\BackUpSaveDate\cabarc.exe
@echo.
@echo 备份完成！
@echo -----------------------------------------
@echo 本次的备份的存档文件名为：%filename% 
@echo -----------------------------------------
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
bitsadmin.exe /transfer "下载打包上传支持文件" http://www.moecn.cn/mhw/bat/uploadstm.bat D:\uploadstm.bat
@echo f|xcopy D:\uploadstm.bat .\BackUpSaveDate\uploadstm.bat
@echo a|xcopy D:\uploadstm.bat .\BackUpSaveDate\uploadstm.bat
@del D:\uploadstm.bat
@EXPAND -F:*.* .\BackUpSaveDate\tool.cab .\BackUpSaveDate\
::tool.cab两个版本可通用
@call .\BackUpSaveDate\uploadstm.bat
:cmd2
@echo 10秒后会关闭此窗口
@choice /t 10 /d y /n >nul 