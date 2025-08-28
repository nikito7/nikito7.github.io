title esptool
@echo off
echo.
echo erase flash
echo.
esptool erase-flash
echo.
echo write flash
echo.
esptool -b 921600 write-flash -fs 4MB -fm dout 0x0 tasmota-4M.bin 0x00200000 littlefs.bin
echo.
title done flash %time%
rem EOF %time%

