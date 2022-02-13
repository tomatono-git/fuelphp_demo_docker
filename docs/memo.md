# メモ

## Docker

- コンテナを起動

    ```powershell
    docker-compose up
    ```

- デタッチモードでコンテナを起動

    ```powershell
    docker-compose up --build -d
    ```

- コンテナを再作成して起動

    ```powershell
    docker-compose up –force-recreate
    ```

- コンテナを一括削除

    ```powershell
    docker-compose down --rmi all --volumes --remove-orphans
    ```

- コンテナを再起動

  ```powershell
  docker restart [コンテナ名]
  ```

  ```powershell
  docker restart php
  ```
<!-- 
  ```powershell
  docker restart fuel_php
  ```
-->

- コンテナに入る

  php

  ```powershell
  docker container exec -it php bash
  ```

  web

  ```powershell
  docker container exec -it web bash
  ```

<!--
  fuel_php

  ```powershell
  docker container exec -it fuel_php bash
  ```

  fuel_web

  ```powershell
  docker container exec -it fuel_web bash
  ```
-->

  Dockerのイメージを検索

  ```powershell
  docker search --filter is-official=true php
  ```

## FuelPHP

- インストール

    <!-- ```sh
    git clone https://github.com/fuel/fuel.git -b 1.8/master
    ``` -->

    1.8/master

    ```powershell
    git clone https://github.com/fuel/fuel.git -b 1.8/master
    ```

- クローン

    ```sh
    cd /var/www/
    git clone https://github.com/tomatono-git/fuelphp_demo.git -b dev html
    ```

- Composerのインストール

  ```sh
  cd /tmp/
  curl -s https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
  ```

- Composerのバージョンアップ
  以下のエラーが表示された場合
  `No composer autoloader found. Please run composer to install the FuelPHP framework dependencies first!`
  
  <https://exiz.org/posts/composer-self-update-error/>

  ```sh
  php composer.phar update
  ```  

  ```text
  For additional security you should declare the allow-plugins config with a list of packages names that are allowed to run code. See https://getcomposer.org/allow-plugins
  You have until July 2022 to add the setting. Composer will then switch the default behavior to disallow all plugins.
  ```

  composer.json に以下の設定を追加

  ```json
  {
    // ・・・
    "config": {
        "allow-plugins": {
            "composer/installers": true,
            "fuel/core": true,
            "fuel/auth": true,
            "fuel/email": true,
            "fuel/oil": true,
            "fuel/orm": true,
            "fuel/parser": true,
            "fuelphp/upload": true,
            "cakephp/plugin-installer": true,
        }
    },
    // ・・・
  }  
  ```

<!--
  ```sh
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  ```
-->

- Composerによる更新

  ```sh
  cd /var/www/html
  composer update
  ```

- 更新

  ```sh
  php composer.phar self-update
  ```

### マイグレーション

#### 事前準備

初回のマイグレーションは migration テーブルの生成に失敗するので、事前にテーブルを作成しておく。

```sql
create table public.migration (
  type character varying(25) not null
  , name character varying(50) not null
  , migration character varying(100) default '' not null
);
```

エラー内容

```console
Uncaught exception Fuel\Core\Database_Exception: 42601 - SQLSTATE[42601]: Syntax error: 7 ERROR:  syntax error at or near "DEFAULT"
LINE 5: ) DEFAULT  CHARACTER SET utf8;
          ^ with query: "CREATE TABLE IF NOT EXISTS "migration" (
        "type" varchar(25) NOT NULL,
        "name" varchar(50) NOT NULL,
        "migration" varchar(100) DEFAULT '' NOT NULL
) DEFAULT  CHARACTER SET utf8;" in /var/www/html/fuel/core/classes/database/pdo/connection.php on line 235
```

migration テーブル作成後は以下のエラー。

```console
Uncaught exception Fuel\Core\Database_Exception: 42601 - SQLSTATE[42601]: Syntax error: 7 ERROR:  syntax error at or near "("
LINE 2:  "id" int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                 ^ with query: "CREATE TABLE IF NOT EXISTS "users" (
        "id" int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        "name" varchar(100) NOT NULL,
        "email" varchar(255) NOT NULL,
        "password" varchar(255) NOT NULL,
        "created_at" date NOT NULL,
        "updated_at" date NOT NULL,
        PRIMARY KEY ("id")
) DEFAULT  CHARACTER SET utf8;" in /var/www/html/fuel/core/classes/database/pdo/connection.php on line 235
```

#### 実行

- migration

  テーブルのマイグレーションファイルを作成
  users

  ```sh
  php oil generate migration create_users
  ```

  マイグレーションの実行

  ```sh
  php oil refine migrate
  ```

  ```sh
  php oil refine migrate:down
  ```

### ソース自動生成

- テーブルからModel作成 (usersテーブル)

  ```sh
  php oil r fromdb:model user --crud
  ```

## PHP

- xdebug 設定ファイルの場所
    /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
- PHP実行ファイルの場所

  ```sh
  witch php
  ```

## DB

- クライアント
  - ホスト名
    localhost
  - ポート番号
    15432
  - データベース名
    app_dev
  - ユーザー名
    app_dev
  - パスワード
    pass
- pgadmin4
  - ホスト名
    db
    <!-- fuel_db -->
    ※docker-compose.yml の サービス名になる。
  - ポート番号
    5432
    ※コンテナ側のポート番号を指定
  - データベース名
    app_dev
  - ユーザー名
    app_dev
  - パスワード
    pass

## vim

文字コードをUTF-8に変更
~/.vimrc

```code
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
```

```vim
:source ~/.vimrc
```

## APサーバー

再起動

```sh
sudo systemctl restart php-fpm.service
```
