# 音声モデル利用時の注意

[READMEへ戻る](../../README.md) | [English](../en/voice-model-terms.md)

StackChan Pet Talk では、Piper Plus と iPhone 用 Style-Bert-VITS2 の音声モデルをユーザーが選択して利用できます。
音声モデルには、モデルごとのライセンスや利用条件があります。利用前に、必ず配布元のモデルカードと利用規約を確認してください。

## Style-Bert-VITS2 音声モデルについて

Style-Bert-VITS2 は、配布者がこのアプリ向けに変換した BERT フォルダと VITS2
フォルダを選択して使います。変換元モデルのライセンス、話者・キャラクターの利用条件、
生成音声の公開条件、変換済みファイルの再配布条件はモデルごとに異なります。

変換済みモデルを受け取る時や第三者へ配布する時は、変換元、必要なクレジット、
商用利用や再配布の可否を確認してください。アプリがモデルを読み込めることは、その
利用や再配布が許諾されていることを意味しません。

## つくよみちゃん音声モデルについて

次の Piper Plus つくよみちゃん音声モデルも、ユーザーが用意してアプリから選択できます。

- Piper Plus つくよみちゃん: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json
- つくよみちゃんコーパス利用規約: https://tyc.rei-yumesaki.net/material/corpus/
- つくよみちゃんボイスを StackChan Pet Talk の生成テキストの読み上げに使用し、その様子を動画等の形式で公開する場合の利用規約: https://tyc.rei-yumesaki.net/material/corpus/#terms2
- つくよみちゃんキャラクターライセンス: https://tyc.rei-yumesaki.net/about/terms/

初回セットアップでは、まず `piper-plus-css10-ja-6lang` を案内しています。つくよみちゃん音声モデルを使う場合は、モデルカードとつくよみちゃん側の利用条件を確認したうえで設定してください。
また、つくよみちゃんコーパス側にはクレジット表記の義務があります。公開・配布・動画投稿などを行う場合は、利用規約に従って必要なクレジットを記載してください。

アプリでは `Piper Plus モデル (.onnx)` に `tsukuyomi-chan-6lang-fp16.onnx`、`Piper Plus 設定 (.json)` に `config.json` を選択します。iPhone の Safari で `config.json` が中身表示になる場合は、Hugging Face の `raw` 表示画面を長押しして `リンク先のファイルをダウンロード` を選んでください。

## 出力音声の利用禁止事項

つくよみちゃん音声モデルを利用する場合、出力された音声を次の目的で使用することを禁止します。

- 人を批判・攻撃すること。
- 特定の政治的立場・宗教・思想への賛同または反対を呼びかけること。
- 刺激の強い表現をゾーニングなしで公開すること。
- 他者に対して二次利用、素材としての利用を許可する形で公開すること。

「人を批判・攻撃すること」の定義は、つくよみちゃんキャラクターライセンスの condition3 に準じます。

https://tyc.rei-yumesaki.net/about/terms/#condition3

## LLM出力について

LLM は予期しない出力をすることがあります。偶発的に不適切な発話が生成された場合でも、それを上記の目的で利用したり、面白がってコンテンツとして消費・拡散したりしないでください。

アプリは TTS の直前に軽量な語彙ルールで確認を行い、該当する可能性がある場合は音声合成だけをスキップすることがあります。この確認は補助的な対策であり、利用条件の確認や利用者自身の判断を置き換えるものではありません。
