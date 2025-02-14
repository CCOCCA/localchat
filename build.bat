@echo off

echo ====== build server ======
call fvm flutter build windows --release

echo ====== build web ======
call fvm flutter build web  --base-href /front/ --release -t lib/web/web_main.dart

echo ====== copy web static resource ======
rd /s/q build\windows\runner\Release\build\
md build\windows\runner\Release\build\web
xcopy build\web\*.* build\windows\runner\Release\build\web /e /y /h /r /q
xcopy cpplibs\*.* build\windows\runner\Release\ /e /y /h /r /q
echo release dir is %cd%\build\windows\runner\Release
pause