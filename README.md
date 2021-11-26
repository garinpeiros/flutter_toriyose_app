# flutter_toriyose_app

楽天商品 API を利用した Flutter アプリです。
過去に個人でリリースした Swift 製アプリを Flutter で作り直してみた「土台」をアップしています。

https://play.google.com/store/apps/details?id=com.wixsite.otoriyosegurume11n.toriyose

## Atomic Design を採用

Atomic Design を採用し、パーツの粒度に応じて分解する方法をとりました。

### atoms(原子)

「ラベル」「ボタン」というように、これ以上分けられないような単位の UI を atoms ディレクトリに配置しました。

### molecules(分子)

「ラベル」「ボタン」の組み合わせでできているパーツを molecules ディレクトリに配置しました。

### organisms(有機体)

テーブルのレコードなど他の molecules の集まりで構成されたパーツを organisms ディレクトリに配置しました。

## Riverpod による状態管理

https://riverpod.dev/
