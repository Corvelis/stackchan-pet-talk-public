# Android ベータ版について

[READMEへ戻る](../../README.md) | [English](../en/android-beta.md)

Android 版は Google Play の公開テストで配布しています。
参加にはGoogleアカウントが必要ですが、Googleグループへの登録や個別の承認は不要です。

## 1. Google Playの公開テストに参加する

Android端末でGoogle Playのテスト参加リンクを開きます。

Google Play テスト参加リンク:

https://play.google.com/apps/testing/app.stackchan.pet.talk

表示された画面で `テスターになる` を押してください。その後、Google Play から `StackChan Pet Talk` をインストールします。

Playストアのアプリページ:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

テスト参加リンクは、公開テストへ参加するためのオプトインリンクです。Playストアのアプリページから直接参加できる場合もありますが、表示されない場合は先にテスト参加リンクを開いてください。

対象国や公開状態の反映に少し時間がかかる場合があります。「このアイテムは利用できません」と表示される場合は、利用中のGoogleアカウントと対象国を確認し、しばらく待ってからもう一度開いてください。

## 2. 初回セットアップを行う

インストール後は [初回セットアップ](getting-started.md) に沿って、ｽﾀｯｸﾁｬﾝ本体への接続、ローカルLLM、Piper Plus TTS、会話開始までを確認してください。

## 必要なもの

Android 版でも、主要機能には以下が必要です。

- ｽﾀｯｸﾁｬﾝ本体
- `stackchan-pet-fw`
- Android 端末
- ｽﾀｯｸﾁｬﾝ本体と Android 端末が接続できる Wi-Fi 環境、Stack-chan SoftAP、または USB Serial 接続
- ローカルで会話を試す場合は、LiteRT-LM 用の `.litertlm` または llama.cpp 用の `.gguf` モデルファイル
- Piper Plus で音声合成を試す場合は、`.onnx` 音声モデルと対応する `.json` 設定ファイル

対応ファームウェア:

https://github.com/Corvelis/stackchan-pet-fw

## Androidで確認してほしいこと

- アプリのインストールと起動
- ｽﾀｯｸﾁｬﾝ本体への SoftAP / Wi-Fi IP / USB Serial 接続
- テキスト会話
- マイクボタンからの音声入力
- Piper Plus による音声合成
- LiteRT-LM または llama.cpp によるローカルLLM会話
- StopWatchからのスマートフォンカメラ遠隔撮影
- 対応するQualcomm Adreno端末でのllama.cpp OpenCL GPU実行
- VLM画像先行処理と会話ストリーミング表示
- モデルファイル選択画面の挙動
- Android端末ごとのクラッシュ、発熱、動作の重さ

開発者は主に Xiaomi 15 Ultra で確認しています。他のAndroid端末での動作フィードバックは特に重要です。

## 必要な権限や注意点

初回起動時に、利用する機能に応じて権限の確認が表示される場合があります。

- ネットワーク接続: ｽﾀｯｸﾁｬﾝ本体や外部APIへ接続するため
- マイク: 音声入力を使う場合
- カメラ/写真/ファイル: 任意の画像機能やモデルファイル選択を使う場合
- USB: USB Serial で Stack-chan と接続する場合
- 通知: Androidのバックグラウンド会話を使う場合

Androidは端末メーカーごとの省電力設定が強い場合があります。バックグラウンド会話が止まる場合は、端末のバッテリー最適化やバックグラウンド制限を確認してください。

## Google Play テスト配布時の注意

Android 版を Google Play のテストトラックで配布する場合、配布者は Google Play Console 上で、テスター管理と不具合対応に必要な範囲の情報を確認できる場合があります。たとえば、テスターリスト、参加状況、端末や Android バージョンに関する集計情報、クラッシュや ANR などの診断情報です。

配布者は、これらの情報をベータテストの運用、不具合調査、改善のためにのみ利用します。不要な目的で利用することはありません。

Google Play の公開テストは、テスト参加リンクでのオプトイン、審査、国/地域設定、端末互換性、反映待ち時間により、すぐに利用できない場合があります。
