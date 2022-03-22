# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

hosted at: http://localhost:3000

```
docker-compose run --no-deps web rails new . --force --database=postgresql

docker-compose build

docker-compose up
```

Docker 構築参照：https://docs.docker.com/samples/rails/

- 新規ルート追加して、Controller も追加する場合

```
docker-compose run web rails generate controller Articles index --skip-routes
```

- Rails では、アプリケーションのクラスやモジュールはどこでも利用できる
  Rails では、アプリケーションのクラスやモジュールはどこでも利用できるようになっているので、上のように require を書く必要はありませんし、app/ディレクトリの下で何かを読み込むために require を書いてはいけません。この機能は「オートロード（autoloading: 自動読み込み）」と呼ばれています。

require を書く必要があるのは、以下の 2 つの場合だけです。

lib/ディレクトリの下にあるファイルを読み込む場合
Gemfile で require: false が指定されている gem 依存を読み込む場合

- モデル生成

```
docker-compose run web rails generate model Article title:string body:text
```

- マイグレーション

```
docker-compose run web rails db:migrate
```
