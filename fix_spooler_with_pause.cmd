@echo off
echo ========================
echo ������� �����訥 ������
echo ========================

taskkill /F /IM spoolsv.exe
taskkill /F /IM printfilterpipelinesvc.exe

echo ========================
echo ��⠭�������� �㦡�
echo ========================

net stop spooler

echo ========================
echo ����塞 䠩�� ������� ����
echo ========================

del /f /s /q %windir%\system32\spool\PRINTERS\
del /f /s /q %windir%\system32\spool\SERVERS\

echo ========================
echo ����᪠�� �㦡�
echo ========================

net start spooler

pause