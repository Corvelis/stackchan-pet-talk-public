# StackChan Pet Talk

日本語 | [English](README_en.md)

StackChan Pet Talk は、`stackchan-pet-fw` を入れたｽﾀｯｸﾁｬﾝ本体と組み合わせて、スマートフォンからｽﾀｯｸﾁｬﾝとの会話を試すためのベータ版アプリです。

## ベータ版に参加する

### iPhone / TestFlight

TestFlight 公開リンク:

https://testflight.apple.com/join/Tt1Z4xpT

参加手順は [iPhone / TestFlight 参加方法](docs/ja/ios-testflight.md) を確認してください。

### Android

Android 版は Google Play のクローズドテストで配布しています。

Googleグループ:

https://groups.google.com/g/stackchan-pet-talk-android-beta

テスト参加リンク:

https://play.google.com/apps/testing/app.stackchan.pet.talk

Playストア:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

参加手順は [Android ベータ版について](docs/ja/android-beta.md) を確認してください。

## 必要なもの

- ｽﾀｯｸﾁｬﾝ本体
- `stackchan-pet-fw`
- iPhone または Android 端末
- ｽﾀｯｸﾁｬﾝ本体とスマートフォンが接続できる Wi-Fi 環境、または Stack-chan SoftAP
- ローカルで会話を試す場合は、LiteRT-LM 用の `.litertlm` モデルファイル
- Piper Plus で音声合成を試す場合は、`.onnx` 音声モデルと対応する `.json` 設定ファイル

対応ファームウェア:

https://github.com/Corvelis/stackchan-pet-fw

## テストしてほしいこと

- ｽﾀｯｸﾁｬﾝ本体との接続
- 接続後の会話画面への遷移
- テキスト入力による会話
- 音声認識を使った会話
- 音声合成による返答
- キャラクター設定や会話設定の変更
- 接続できない場合や期待通りに動かない場合のフィードバック

## 開発者の確認環境

開発者は主に以下の端末で動作確認しています。

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## 使い方

- [初回セットアップ](docs/ja/getting-started.md)
- [iPhone / TestFlight 参加方法](docs/ja/ios-testflight.md)
- [Android ベータ版参加方法](docs/ja/android-beta.md)
- [トラブルシューティング](docs/ja/troubleshooting.md)
- [詳しい操作手順](docs/ja/user-manual.md)

## 注意

このアプリの主要機能を使うには、同一ローカルネットワーク上のｽﾀｯｸﾁｬﾝ本体が必要です。ｽﾀｯｸﾁｬﾝ本体が見つからない場合、会話画面には進めません。

外部 API を設定した場合、会話内容、プロンプト、音声認識対象データ、画像入力などが選択した API 提供元へ送信される場合があります。

Piper Plus の音声モデルにはモデルごとの利用条件があります。つくよみちゃん音声モデルもユーザーが用意して利用できますが、出力音声の利用には禁止事項があります。詳しくは [音声モデル利用時の注意](docs/ja/voice-model-terms.md) を確認してください。

## プライバシーとライセンス

- [プライバシーポリシー](privacy/ja.md)
- [Privacy Policy](privacy/en.md)
- [サードパーティライセンス](THIRD_PARTY_LICENSES_ja.md)
- [モデル/辞書/ランタイムの入手先](docs/ja/model-downloads.md)
- [音声モデル利用時の注意](docs/ja/voice-model-terms.md)
