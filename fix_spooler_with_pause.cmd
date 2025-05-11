@echo off
echo ========================
echo Убиваем зависшие процессы
echo ========================

taskkill /F /IM spoolsv.exe
taskkill /F /IM printfilterpipelinesvc.exe

echo ========================
echo Останавливаем службу
echo ========================

net stop spooler

echo ========================
echo Удаляем файлы заданий печати
echo ========================

del /f /s /q %windir%\system32\spool\PRINTERS\
del /f /s /q %windir%\system32\spool\SERVERS\

echo ========================
echo Запускаем службу
echo ========================

net start spooler

pause