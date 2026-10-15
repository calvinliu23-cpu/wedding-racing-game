#!/bin/bash
# 雙擊這個檔案就會自動安裝並啟動遊戲伺服器（僅限 Mac）
# 若雙擊沒反應，可能要先在「終端機」執行一次：chmod +x start-mac.command

cd "$(dirname "$0")"

echo "======================================"
echo "  🏎️  婚禮現場互動賽車大戰 - 啟動中"
echo "======================================"
echo ""

if ! command -v node &> /dev/null; then
  echo "❌ 找不到 Node.js，請先到 https://nodejs.org 下載安裝「LTS 版本」"
  echo "   安裝完成後，再重新雙擊這個檔案一次。"
  echo ""
  read -p "按 Enter 鍵關閉視窗..."
  exit 1
fi

echo "✅ 已偵測到 Node.js，版本：$(node -v)"
echo ""
echo "📦 第一次啟動需要安裝套件，請稍等（之後會很快）..."
npm install

echo ""
echo "🚀 伺服器啟動中！請保持這個黑色視窗開著，不要關閉。"
echo ""
echo "----------------------------------------------------"
echo "  請用瀏覽器打開以下網址："
echo "    賓客加入頁： http://localhost:3000/"
echo "    大螢幕：     http://localhost:3000/display"
echo "    後台管理：   http://localhost:3000/admin"
echo "----------------------------------------------------"
echo ""
echo "  要讓手機也能加入，請改用電腦的區網 IP，例如："
echo "    http://192.168.x.x:3000/"
echo "  （下方會顯示可用的網路位址，找 IPv4 那一行）"
echo ""
ipconfig getifaddr en0 2>/dev/null | xargs -I{} echo "  你的電腦 IP 可能是： http://{}:3000/"
echo ""

npm start
