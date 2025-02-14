#!/bin/bash
set -e

# 古いPIDファイルやソケットファイルを削除
rm -rf /web1/tmp/{pids,sockets}

# 必要なディレクトリを作成
mkdir -p /web1/tmp/{pids,sockets}

# マイグレーションを実行
bundle exec rails db:migrate

exec "$@"