@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ======================================
echo   婚禮現場互動賽車大戰 - 啟動中
echo ======================================
echo.

where node >nul 2>nul
if %errorlevel% neq 0 (
  echo [錯誤] 找不到 Node.js，請先到 https://nodejs.org 下載安裝「LTS 版本」
  echo 安裝完成後，再重新雙擊這個檔案一次。
  echo.
  pause
  exit /b 1
)

for /f "tokens=*" %%v in ('node -v') do set NODEV=%%v
echo [OK] 已偵測到 Node.js，版本：%NODEV%
echo.
echo 第一次啟動需要安裝套件，請稍等（之後會很快）...
call npm install

echo.
echo 伺服器啟動中！請保持這個黑色視窗開著，不要關閉。
echo.
echo ----------------------------------------------------
echo   請用瀏覽器打開以下網址：
echo     賓客加入頁： http://localhost:3000/
echo     大螢幕：     http://localhost:3000/display
echo     後台管理：   http://localhost:3000/admin
echo ----------------------------------------------------
echo.
echo   要讓手機也能加入，請改用電腦的區網 IP，例如：
echo     http://192.168.x.x:3000/
echo   （下面會列出你的網路資訊，找「IPv4 位址」那一行）
echo.
ipconfig | findstr /i "IPv4"
echo.

call npm start
pause
