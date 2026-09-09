# Poker ROI Tracker Cloud v2

功能：GitHub Pages 免費部署、Supabase 雲端同步、Email Magic Link 登入、Tournament / Cash 分類、幣別、Series、地點、Bankroll、ROI、總時數、平均時薪、盈虧曲線、CSV/JSON 匯出。

## Supabase
1. 建立免費 Project。
2. SQL Editor 執行 `supabase.sql`。
3. 在 Project Settings / API 複製 Project URL 與 anon/public key。
4. 填入 `config.js`。請勿使用 service_role key。
5. Authentication > URL Configuration：Site URL 設為你的 GitHub Pages 網址；Redirect URLs 加入同網址 `/**`。

## GitHub Pages
1. 建立 repo，例如 `poker-roi`。
2. 將本資料夾所有檔案上傳到 repo 根目錄。
3. Settings > Pages > Deploy from a branch > main / root。
4. 網址通常為 `https://你的帳號.github.io/poker-roi/`。

登入同一 Email 的不同裝置會看到同一份資料。
