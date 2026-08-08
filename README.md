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

## 最新アップデート

バージョン `1.0.6 (48)` では、StopWatchからのスマートフォンカメラ遠隔撮影、
ローカルVLMの画像先行処理とKVキャッシュ、会話ストリーミング表示の高速化に
対応しました。Androidでは対応するQualcomm Adreno端末でOpenCL GPUを利用でき、
iOSではMetalによるTQ2_0量子化モデルの処理に対応しています。

詳しくは [リリースノート](docs/ja/release-notes.md) を確認してください。

## 必要なもの

- ｽﾀｯｸﾁｬﾝ本体
- `stackchan-pet-fw`
- iPhone または Android 端末
- ｽﾀｯｸﾁｬﾝ本体とスマートフォンが接続できる Wi-Fi 環境、Stack-chan SoftAP、または Android の USB Serial 接続
- ローカルで会話を試す場合は、LiteRT-LM 用の `.litertlm` または llama.cpp 用の `.gguf` モデルファイル
- Piper Plus で音声合成を試す場合は、`.onnx` 音声モデルと対応する `.json` 設定ファイル
- iPhone で Style-Bert-VITS2 を試す場合は、変換済みの BERT / VITS2 モデルフォルダ

対応ファームウェア:

https://github.com/Corvelis/stackchan-pet-fw

## すれ違い通信

対応ファームウェアでは、Stack-chan 同士のすれ違い履歴をアプリへ同期できます。

アプリの `設定 > すれ違い通信` から、以下を操作できます。

- Stack-chan 本体とのすれ違い履歴同期
- すれ違いプロフィールの名前とメッセージ編集
- すれ違った相手ごとの履歴表示
- 相手ごとの履歴削除、メッセージ単位の削除

通信は通常の WebSocket 接続に加えて、Android では USB Serial 接続にも対応します。
USB Serial は既存の Stack-chan USB プロトコルの SCU1 JSON frame を使います。

プロフィール文字数には UTF-8 byte 制限があります。

- 名前: 最大 32 bytes
- メッセージ: 最大 80 bytes

日本語では、名前は約10文字、メッセージは約26文字が目安です。

## 新しいベータ機能

- 対応する StopWatch / Stack-chan のストップウォッチ、タイマー、ポモドーロ、10秒当てを、設定したキャラクターの声で案内できます。詳しくは [時間機能の発話](docs/ja/timekeeper.md) を確認してください。
- ユーザーが用意した Hermes API サーバーを会話用 Agent として利用し、対応機能、ツール進捗、サーバー上の会話履歴を確認できます。詳しくは [Hermes Agent の使い方](docs/ja/hermes-agent.md) を確認してください。
- DeepSeek V4 Flash など思考過程を返す対応 LLM では、最終回答と分けて折り畳み表示します。読み上げと思い出には最終回答だけを使います。
- SoftAP 接続中でも、対応端末では Stack-chan とのローカル通信を Wi-Fi に残し、外部 API への公開インターネット通信をモバイルデータ経由で試みます。

## 開発者の確認環境

開発者は主に以下の端末で動作確認しています。

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## 使い方

- [初回セットアップ](docs/ja/getting-started.md)
- [iPhone / TestFlight 参加方法](docs/ja/ios-testflight.md)
- [Android ベータ版参加方法](docs/ja/android-beta.md)
- [リリースノート](docs/ja/release-notes.md)
- [トラブルシューティング](docs/ja/troubleshooting.md)
- [詳しい操作手順](docs/ja/user-manual.md)
- [思い出と日記の使い方](docs/ja/diary.md)
- [時間機能の発話](docs/ja/timekeeper.md)
- [Hermes Agent の使い方](docs/ja/hermes-agent.md)

## 注意

このアプリの主要機能を使うには、同一ローカルネットワーク上のｽﾀｯｸﾁｬﾝ本体が必要です。ｽﾀｯｸﾁｬﾝ本体が見つからない場合、会話画面には進めません。

外部 API を設定した場合、会話内容、プロンプト、音声認識対象データ、画像入力などが選択した API 提供元へ送信される場合があります。

SoftAP 接続中に外部 API を使うと、モバイルデータ通信量が発生する場合があります。Hermes Agent のスキル、ツール、Agent Memory、会話履歴の扱いは、接続先サーバーの構成と運用方針に依存します。

Piper Plus の音声モデルにはモデルごとの利用条件があります。つくよみちゃん音声モデルもユーザーが用意して利用できますが、出力音声の利用には禁止事項があります。詳しくは [音声モデル利用時の注意](docs/ja/voice-model-terms.md) を確認してください。

## プライバシーとライセンス

- この公開リポジトリ内の当方作成ドキュメントは [Apache-2.0](LICENSE) で公開しています。
- 音声モデル、LLM、辞書、ファームウェア、外部サービスにはそれぞれの配布元ライセンスや利用条件が適用されます。
- [プライバシーポリシー](privacy/ja.md)
- [Privacy Policy](privacy/en.md)
- [サードパーティライセンス](THIRD_PARTY_LICENSES_ja.md)
- [モデル/辞書/ランタイムの入手先](docs/ja/model-downloads.md)
- [音声モデル利用時の注意](docs/ja/voice-model-terms.md)
