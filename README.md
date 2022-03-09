# timecard

【作成中】そのうちタイムカードになる予定。　Flutter Web
## 作業メモ

3/10
Web3.storage (https://web3.storage/) を使いたいので、この間書いたpackage:jsを使って連動させる。
npmのライブラリしかないので、esbuildで一つのファイルにしてそれを利用したいのだけど、
綺麗にバンドルする方法がわからず、出力された out.js を手動で最初と最後の括弧を外したりしてなんとか動かしてみた。
こんな感じで、ビルドして
```
cd js_bundle
npm run build
cp out.js ../web/out.js // <- 要：手作業で使うfunctionが見えるように調整
```


3/7
JSのライブラリを使いたいので、package:jsを動かしてみる。
それようにこれを、あれこれ。（https://pub.dev/packages/js）
```
flutter pub add js && flutter pub get
```


## 参考
Flutter で作ってます。

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# time-card
