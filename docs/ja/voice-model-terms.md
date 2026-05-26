# 音声モデル利用時の注意

[READMEへ戻る](../../README.md) | [English](../en/voice-model-terms.md)

StackChan Pet Talk では、Piper Plus の音声モデルをユーザーが選択して利用できます。
音声モデルには、モデルごとのライセンスや利用条件があります。利用前に、必ず配布元のモデルカードと利用規約を確認してください。

## つくよみちゃん音声モデルについて

次の非公式 Piper Plus つくよみちゃん音声モデルも、ユーザーが用意してアプリから選択できます。

- Piper Plus つくよみちゃん: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json
- つくよみちゃんコーパス利用規約: https://tyc.rei-yumesaki.net/material/corpus/#terms3
- つくよみちゃんキャラクターライセンス: https://tyc.rei-yumesaki.net/about/terms/#condition3

初回セットアップでは、まず `piper-plus-css10-ja-6lang` を案内しています。つくよみちゃん音声モデルを使う場合は、モデルカードとつくよみちゃん側の利用条件を確認したうえで設定してください。

アプリでは `Piper Plus モデル (.onnx)` に `tsukuyomi-chan-6lang-fp16.onnx`、`Piper Plus 設定 (.json)` に `config.json` を選択します。iPhone の Safari で `config.json` が中身表示になる場合は、Hugging Face の `raw` 表示画面を長押しして `リンク先のファイルをダウンロード` を選んでください。

## 出力音声の利用禁止事項

つくよみちゃん音声モデルを利用する場合、出力された音声を次の目的で使用することを禁止します。

- 人を批判・攻撃すること。
- 特定の政治的立場・宗教・思想への賛同または反対を呼びかけること。
- 刺激の強い表現をゾーニングなしで公開すること。
- 他者に対して二次利用、素材としての利用を許可する形で公開すること。

「人を批判・攻撃すること」の定義は、つくよみちゃんキャラクターライセンスに準じます。

鑑賞用の作品として配布・販売すること自体は、つくよみちゃん側の規約では禁止されていません。ただし、利用する音声モデル、公開先、配布形態ごとの条件は必ず確認してください。

## LLM出力について

LLM は予期しない出力をすることがあります。偶発的に不適切な発話が生成された場合でも、それを上記の目的で利用したり、面白がってコンテンツとして消費・拡散したりしないでください。

アプリは TTS の直前に軽量な語彙ルールで確認を行い、該当する可能性がある場合は音声合成だけをスキップすることがあります。この確認は補助的な対策であり、利用条件の確認や利用者自身の判断を置き換えるものではありません。
