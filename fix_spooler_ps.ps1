# Принудительное завершение процессов
Stop-Process -Name "spoolsv" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "printfilterpipelinesvc" -Force -ErrorAction SilentlyContinue

# Остановка службы диспетчера печати
Stop-Service -Name "Spooler" -Force -ErrorAction Stop

# Очистка файлов спулера
Remove-Item -Path "$env:windir\System32\spool\PRINTERS\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\System32\spool\SERVERS\*" -Recurse -Force -ErrorAction SilentlyContinue

# Перезапуск службы диспетчера печати
Start-Service -Name "Spooler" -ErrorAction Stop

Write-Host "Очередь печати успешно очищена" -ForegroundColor Green