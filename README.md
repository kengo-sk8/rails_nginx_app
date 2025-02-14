# 概要
`Docker` + `Docker compose` + `Rails8` + `Nginx` + `MySQL8`の環境を構築する。下記に、この環境を動作させる為の手順を記載する

# .envファイルの設置
- 下記のディレクトリーに`.env`ファイルを設置する

## /backend/web1/settings/.env
- `HOST`と`DATABASE`はの変更は不可
```sh
HOST=db
DATABASE=web1_development
USER_NAME=root # 任意の値でも可能
PASSWORD=password # 任意の値でも可能
```

## /db/conf/.env
- `MYSQL_DATABASE`と`MYSQL_ROOT_PASSWORD`は、`/backend/web1/settings/.env`と同じ値に設定する
```sh
MYSQL_DATABASE=web1_development
MYSQL_ROOT_PASSWORD=password
TZ=Asia/Tokyo
```

## /phpmyadmin/conf/.env
- `PMA_USER`と`PMA_PASSWORD`は、`/backend/web1/settings/.env`と同じ値に設定する
- その他の設定値は、変更不可(コンテナーが起動しなくなる) 
```sh
PMA_ARBITRARY=1
PMA_HOSTS=db
PMA_USER=root
PMA_PASSWORD=password
```

# 起動コマンド
```sh
# コンテナーの立ち下げ
docker rm $(docker ps -aq)

# イメージをビルド
docker compose build --no-cache

# 不要なイメージを消去
docker images -f "dangling=true" -q | xargs docker rmi

# コンテナーの起動
docker compose up -d
```

# 構築の詳細情報
- [ローカル環にて、Docker + Docker compose + Rails8 + Nginx + MySQL8の環境を構築]()