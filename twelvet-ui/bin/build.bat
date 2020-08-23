@echo off
echo.
echo [info] TwelveT UI is build
echo.

%~d0
cd %~dp0

cd ..
yarn build

pause