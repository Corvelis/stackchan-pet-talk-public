# 初回セットアップ

[READMEへ戻る](../../README.md) | [English](../en/getting-started.md)

この手順は、StackChan Pet Talk を初めて使うテスター向けです。

## 1. 用意するもの

- ｽﾀｯｸﾁｬﾝ本体
- `stackchan-pet-fw`
- iPhone または Android 端末
- ｽﾀｯｸﾁｬﾝ本体とスマートフォンが接続できる Wi-Fi 環境、または Stack-chan SoftAP
- ローカルで会話を試す場合は、LiteRT-LM 用の `.litertlm` モデルファイル
- Piper Plus で音声合成を試す場合は、`.onnx` 音声モデルと対応する `.json` 設定ファイル

対応ファームウェア:

https://github.com/Corvelis/stackchan-pet-fw

開発者は主に以下の端末で動作確認しています。

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## 2. アプリをインストールする

iPhone の場合:

1. [iPhone / TestFlight 参加方法](ios-testflight.md) を開きます。
2. TestFlight アプリをインストールします。
3. 配布された TestFlight リンクを開きます。
4. `StackChan Pet Talk` をインストールします。

Android の場合:

1. [Android ベータ版について](android-beta.md) を開きます。
2. Androidベータ用のGoogleグループに参加します。
3. Google Play のテスト参加リンクを開きます。
4. `テスターになる` を押します。
5. Google Play から `StackChan Pet Talk` をインストールします。

## 3. ｽﾀｯｸﾁｬﾝ本体を準備する

1. ｽﾀｯｸﾁｬﾝ本体に `stackchan-pet-fw` を入れます。
2. ｽﾀｯｸﾁｬﾝ本体を起動します。
3. スマートフォンから接続できる状態にします。

接続方式は主に次のどちらかです。

| 接続方式 | 内容 |
| --- | --- |
| SoftAP | スマートフォンを Stack-chan の Wi-Fi に接続します。通常の Host は `192.168.4.1`、Port は `8080` です。 |
| Wi-Fi IP | ｽﾀｯｸﾁｬﾝ本体とスマートフォンを同じ Wi-Fi に接続し、ｽﾀｯｸﾁｬﾝ本体の IP アドレスを指定します。 |

## 4. アプリから接続する

1. `StackChan Pet Talk` を起動します。
2. 接続方式を選びます。
3. Host と Port を確認します。
4. `接続` を押します。
5. 接続できると会話画面に進みます。

ｽﾀｯｸﾁｬﾝ本体が見つからない場合、会話画面には進めません。

## 5. ローカルLLMを用意する

ローカルで会話を試す場合は、まず LiteRT-LM のモデルファイルを用意します。

推奨する最初のモデル:

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- 選ぶファイル: `gemma-4-E2B-it.litertlm`
- 直接ダウンロード: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

注意:

- このアプリの LiteRT-LM 設定では `.litertlm` ファイルを選びます。
- `.task` ファイルは選択対象外です。
- `gemma-4-E2B-it-web.litertlm` は通常のスマートフォンアプリ向けではありません。
- ファイルサイズが大きい場合があります。PCでダウンロードして、AirDrop、iCloud Drive、USB、Google Driveなどでスマートフォンのファイルアプリへ移すと確実です。

iPhoneでの配置例:

```text
ファイル App
  このiPhone内 または iCloud Drive
    StackChanPetTalk/
      llm/
        gemma-4-E2B-it.litertlm
```

Androidでの配置例:

```text
Files または ダウンロード
  StackChanPetTalk/
    llm/
      gemma-4-E2B-it.litertlm
```

アプリでの設定:

1. 会話画面または設定アイコンから `設定` を開きます。
2. `LLM` を開きます。
3. プロバイダーで `LiteRT-LM` を選びます。
4. `LiteRT-LM モデルファイル (.litertlm)` から `gemma-4-E2B-it.litertlm` を選びます。
5. まずは既定値のまま保存します。
6. `ウォームアップ` ボタンを押して、モデルが読み込めるか確認します。

モデルの詳細と注意点は [モデル/辞書/ランタイムの入手先](model-downloads.md) を確認してください。

## 6. Piper Plus TTSを用意する

ｽﾀｯｸﾁｬﾝ本体から返答音声を出したい場合は、Piper Plus の音声モデルを用意します。

スマートフォンだけで試す場合の最初の例:

- Repository: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json

iPhone の Safari で `config.json` をダウンロードする場合は、Hugging Face の `raw` で JSON の中身を表示し、表示中のページを長押しして `リンク先のファイルをダウンロード` を選びます。普通にタップするとダウンロード確認ではなく中身表示になるため、この長押し操作で保存してください。

PCで Piper Plus のコマンドを使える場合の開始点:

- Piper Plus base model: https://huggingface.co/ayousanz/piper-plus-base
- Piper Plus 側のダウンロードコマンド: `piper --download-model base`

利用可能な追加モデル:

- Piper Plus つくよみちゃん: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json

つくよみちゃん音声モデルを使う場合は、[音声モデル利用時の注意](voice-model-terms.md) と配布元の利用条件を確認してください。

必要なファイル:

- `.onnx` 音声モデル
- 対応する `.json` または `.onnx.json` 設定ファイル

iPhoneでの配置例:

```text
ファイル App
  このiPhone内 または iCloud Drive
    StackChanPetTalk/
      piper-plus/
        css10-ja-6lang-fp16.onnx
        config.json
```

Androidでの配置例:

```text
Files または ダウンロード
  StackChanPetTalk/
    piper-plus/
      css10-ja-6lang-fp16.onnx
      config.json
```

アプリでの設定:

1. `設定 > 音声AI` を開きます。
2. `TTS エンジン` で `Piper Plus` を選びます。
3. `Piper Plus モデル (.onnx)` から `css10-ja-6lang-fp16.onnx` を選びます。
4. `Piper Plus 設定 (.json)` から `config.json` を選びます。
5. ウォームアップ、テスト発話、または短い会話で音声が出るか確認します。

iPhone でダウンロードしたファイルが見つからない場合は、`ファイル` アプリの `iCloud Drive > ダウンロード` または `このiPhone内 > ダウンロード` を確認します。`config.json.txt` や `config.json.download` のような名前になっている場合は、長押しして `名称変更` から `config.json` に直してください。

注意:

- Piper Plus の音声モデルにはモデルごとのライセンスや利用条件があります。
- スマートフォンだけで試す場合は、まず上記の `.onnx` と `config.json` の組み合わせから試す想定です。
- PCでモデルを準備できる場合は、`piper-plus-base` を `piper --download-model base` で取得して使う方法もあります。
- つくよみちゃんなどのキャラクター音声を使う場合は、モデル配布元の条件と [音声モデル利用時の注意](voice-model-terms.md) を必ず確認してください。

詳しい入手先は [モデル/辞書/ランタイムの入手先](model-downloads.md) を確認してください。

## 7. 会話を試す

接続に成功すると会話画面に進みます。LLM と TTS の設定が終わったら、設定画面から元の会話画面に戻って試します。まずはテキスト入力で会話を試してください。

1. 会話画面下部の入力欄に短いメッセージを入力します。
2. 送信ボタンを押します。
3. 返答が会話履歴に表示されるか確認します。
4. TTS が有効な場合は、ｽﾀｯｸﾁｬﾝ本体から返答音声が再生されるか確認します。

最初は、次のような短い文で試すのがおすすめです。

```text
こんにちは
今日の気分はどう？
自己紹介して
```

音声会話を使う場合は、テキスト会話が動くことを確認してから試してください。

1. `設定 > 音声AI` を開きます。
2. ASR と TTS の設定を確認します。TTS は Piper Plus のモデルと設定ファイルが選択済みであることを確認します。
3. 会話画面に戻ります。
4. 画面下部のマイクボタンを押します。
5. 発話が開始されたら、ｽﾀｯｸﾁｬﾝに話しかけます。
6. 音声認識結果、LLM の返答、ｽﾀｯｸﾁｬﾝ本体からの返答音声を確認します。

音声会話には、アプリの音声設定とｽﾀｯｸﾁｬﾝ本体側のマイク/スピーカー連携が必要です。

## 8. 詳しい操作手順

詳しい画面説明、音声AI、LLM、キャラクター設定、マスター認識などは [詳しい操作手順](user-manual.md) にまとめています。

## 9. 困ったとき

接続できない、会話できない、音が出ない場合は [トラブルシューティング](troubleshooting.md) を確認してください。
