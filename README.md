# PHP Laravel

以 Laravel 建立的 Web 應用程式。目前專案保留 Laravel 預設首頁與基礎目錄結構，使用 SQLite 作為預設資料庫，並整合 Vite 與 Tailwind CSS 進行前端資源建置。

## 技術需求

安裝 [Docker Desktop](https://www.docker.com/products/docker-desktop/)，不需要在本機另外安裝 PHP、Composer 或 Node.js。

## 初始建立專案(不用執行)

```bash
docker compose exec php composer create-project laravel/laravel .
```

## 快速開始（Docker）

### 1. 建立 PHP 映像

```bash
docker compose build
```

### 2. 安裝後端依賴

```bash
docker compose run --rm php composer install
```

### 3. 建立環境設定

```bash
cp .env.example .env
```

建立資料表：

```bash
docker compose run --rm php php artisan key:generate
docker compose run --rm php php artisan migrate
```

### 4. 建置前端資源

```bash
docker run --rm -v "$PWD:/app" -w /app node:24-alpine npm install
docker run --rm -v "$PWD:/app" -w /app node:24-alpine npm run build
```

### 5. 啟動伺服器

```bash
docker compose up
```

開啟 <http://localhost:8080>。

## 常用指令

執行測試：

```bash
docker compose run --rm php php artisan test
```

檢查並修正 PHP 程式碼格式：

```bash
docker compose run --rm php vendor/bin/pint
```

重新執行資料庫 migration：

```bash
docker compose run --rm php php artisan migrate:fresh --seed
```

清除 Laravel 快取：

```bash
docker compose run --rm php php artisan optimize:clear
```

## 專案結構

```text
app/            應用程式核心程式碼
config/         Laravel 設定檔
database/       Migration、Factory 與 Seeder
public/         Web 入口與公開資源
resources/      前端畫面Blade、CSS 與 JavaScript 原始碼
routes/         Web 與 Console 路由
tests/          Feature 與 Unit 測試
```

## 環境設定

預設使用 `database/database.sqlite`。若要改用 MySQL，請在 `.env` 設定 `DB_CONNECTION`、`DB_HOST`、`DB_PORT`、`DB_DATABASE`、`DB_USERNAME` 與 `DB_PASSWORD`，並自行提供可連線的 MySQL 服務。

`.env` 可能包含密碼與金鑰，請勿提交到版本控制。
