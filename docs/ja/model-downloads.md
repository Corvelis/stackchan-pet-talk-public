# モデル/辞書/ランタイムの入手先

English: [model-downloads.md](../en/model-downloads.md)

Git 管理されたソースには、ユーザーが選択して使う音声モデル、ローカル
LLM モデル、SDK 一式、任意の事前ビルドバイナリは含めません。
限定ベータビルドでは、`distribution/model_manifest.yaml` で承認された
モデル、辞書、ランタイムだけを同梱対象にします。

この文書では、次の 2 種類を分けて扱います。

- ユーザーがアプリ設定で選択して使うために別途用意するファイル
- ベータ配布ビルドに同梱される可能性があるファイル

TestFlight で受け取ったアプリを初めて使う場合は、先に
[getting-started.md](getting-started.md) を確認してください。
この文書は、そこで選ぶモデルファイルの入手先、ファイル名、注意点を補足します。

新しいファイルを配布物に含める場合は、配布前に入手元 URL、ライセンス、
ファイルサイズ、SHA-256、同梱/ユーザー選択の扱いを記録してください。
`distribution/model_manifest.yaml` とライセンス表示を更新するまでは、
リリースビルドに追加しないでください。

## ユーザーが実際に使うために用意するファイル

ここが通常利用者やテスターにとって重要な部分です。
以下は「アプリに同梱される認識モデル」とは別で、設定画面から選択して使います。
GitHub からソースコードを取得する必要はありません。Safari、PC、配布者の共有リンク
などからモデルファイルをダウンロードし、iPhone の `ファイル` アプリに保存してから
アプリ内の設定画面で選びます。

Hugging Face から入手する場合は、モデルページの `Files and versions` で対象ファイルを
開き、ダウンロードします。大きな GGUF や `.litertlm` は iPhone だけで扱うと時間が
かかるため、PC でダウンロードして AirDrop、iCloud Drive、USB、または配布者の
モデルパック経由で iPhone の `ファイル` アプリに移す方が確実です。

### Piper Plus TTS 音声モデル

使う場面:

- `設定 > 音声AI > TTS エンジン > Piper Plus`

必要なファイル:

- `.onnx` 音声モデル
- 対応する `.json` または `.onnx.json` 設定ファイル

通常の開始点:

- スマートフォンだけで試す場合の例: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json
- Piper Plus base model: https://huggingface.co/ayousanz/piper-plus-base
- Piper Plus 側のダウンロードコマンド: `piper --download-model base`
- Piper Plus つくよみちゃん: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- つくよみちゃん `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- つくよみちゃん `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json

iPhone の Safari では、`.json` を普通にタップするとダウンロードではなく中身が表示される場合があります。Hugging Face の `raw` で JSON の中身を表示し、その画面を長押しして `リンク先のファイルをダウンロード` を選んでください。

配置例:

```text
models/
  piper-plus/
    css10-ja-6lang-fp16.onnx
    config.json
```

アプリではファイル選択後、モデルと設定ファイルをアプリ管理領域に取り込みます。
元ファイルを移動または削除しても、取り込み済みのコピーが使われます。
TestFlight 版でも操作は同じです。`設定 > 音声AI` で `Piper Plus` を選び、
`.onnx` と `.json` をそれぞれ選択してください。

注意:

- Piper Plus のランタイムと音声モデルはライセンスが別です。
- `piper-plus-base` のモデルカードは現時点で CC-BY-4.0 を表示しています。
- キャラクター音声や特定話者モデルは、モデルカードと配布元の利用条件を必ず確認してください。
- 初回例は `piper-plus-css10-ja-6lang` ですが、つくよみちゃん音声モデルもユーザーが用意して利用できます。
- つくよみちゃん音声モデルを使う場合は、[音声モデル利用時の注意](voice-model-terms.md) と配布元の利用条件を確認してください。

日本語 OpenJTalk 系モデルを使う場合は、OpenJTalk 辞書も必要です。

- OpenJTalk UTF-8 dictionary 1.11:
  https://sourceforge.net/projects/open-jtalk/files/Dictionary/open_jtalk_dic-1.11/open_jtalk_dic_utf_8-1.11.tar.gz/download

開発/ビルド時の配置例:

```text
models/
  openjtalk/
    open_jtalk_dic_utf_8-1.11/
      char.bin
      matrix.bin
      sys.dic
      unk.dic
      dicrc
```

TestFlight 版では、OpenJTalk 辞書は通常テスターが画面から選ぶものではありません。
日本語 OpenJTalk 系 Piper Plus モデルを案内する場合、配布者は辞書を同梱したビルドを
配るか、辞書なしではその音声が使えないことを明記してください。

### LiteRT-LM ローカル LLM

使う場面:

- `設定 > LLM > プロバイダー > LiteRT-LM`

必要なファイル:

- `.litertlm` モデルファイル

Gemma 4 E2B を使う場合の開始点:

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- 通常選ぶファイル: `gemma-4-E2B-it.litertlm`
- 直接ダウンロード: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

注意:

- 現在のアプリ実装では `.litertlm` のみ選択できます。
- `.task` はこのアプリの LiteRT-LM 設定画面では選択対象外です。
- `gemma-4-E2B-it-web.litertlm` は Web 向けです。通常のスマホアプリでは選ばないでください。
- Intel/Qualcomm NPU 向けの `*_intel_*` や `*_qualcomm_*` は、対象ランタイムとハードウェアが一致する場合だけ検討してください。
- モデルページのライセンスと利用条件は配布前に必ず確認してください。
- LiteRT-LM の Android / iOS ランタイムはアプリ側に入っている必要があります。`.litertlm` だけを追加しても、ビルドにランタイムが入っていない場合は使えません。

配置例:

```text
models/
  llm/
    gemma-4-E2B-it.litertlm
```

設定画面でこの `.litertlm` ファイルを選択し、必要に応じて CPU/GPU、
最大トークン数、temperature、topK、topP、コンテキストサイズ、
バッチサイズ、スレッド数を調整します。
TestFlight 版では、`設定 > LLM` で `LiteRT-LM` を選び、
`LiteRT-LM モデルファイル (.litertlm)` からこのファイルを選択します。

### llama.cpp ローカル LLM

使う場面:

- `設定 > LLM > プロバイダー > llama.cpp`

テキスト会話に必要なファイル:

- メインの `.gguf` モデルファイル

画像/VLM を使う場合に追加で必要なファイル:

- 同じモデル系統/同じ配布元/同じ revision の `mmproj*.gguf`

Gemma 4 E2B GGUF の例:

- Repository: https://huggingface.co/batiai/gemma-4-E2B-it-GGUF
- テキストモデル例: `google-gemma-4-E2B-it-Q4_K_M.gguf`
- VLM 用 projector 例: `mmproj-BF16.gguf`

配置例:

```text
models/
  llm/
    gemma-4-E2B-it/
      google-gemma-4-E2B-it-Q4_K_M.gguf
      mmproj-BF16.gguf
```

使い分け:

- テキストだけなら `.gguf` だけで使えます。
- 画像について質問する、OCR、画像説明などを使いたい場合は `mmproj*.gguf` も選びます。
- メイン GGUF と mmproj は、別のモデルや別 revision のものを混ぜないでください。
- TestFlight 版では、`設定 > LLM` で `llama.cpp` を選び、`GGUF モデルファイル` と必要に応じて `mmproj` を選択します。

注意:

- GGUF 変換版はコミュニティ配布の場合があります。
- upstream モデルのライセンス、変換元、量子化条件、商用利用条件を確認してください。
- スマートフォン上で動かす場合、Q4 系など小さめの量子化から試すのが現実的です。
- 大きい GGUF や mmproj は、端末メモリ不足や初回ロードの遅さにつながります。

### クラウド API / PC サーバーを使う場合

以下はアプリ内にモデルファイルを置く必要はありません。

- OpenAI API
- Gemini API
- OpenAI compatible API
- OpenAI transcription API
- OpenAI TTS API
- Irodori TTS サーバー
- whisper.cpp server

必要なのは Base URL、モデル名、API キー、または PC 側サーバー設定です。
スマートフォン実機から PC 上のサーバーに接続する場合、`localhost` は
スマートフォン自身を指します。PC の LAN IP を指定してください。

例:

```text
http://192.168.0.10:8080/v1
http://192.168.0.10:8090
http://192.168.0.10:8088/v1
```

このスクリプトは、`models/` と `native/llama_bridge/ios/lib/litert_lm/`
配下にある配布対象ファイルが `distribution/model_manifest.yaml` に登録され、
SHA-256 が一致することを確認します。
