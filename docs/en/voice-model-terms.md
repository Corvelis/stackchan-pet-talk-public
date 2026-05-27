# Voice Model Usage Notes

[Back to README](../../README_en.md) | [日本語](../ja/voice-model-terms.md)

StackChan Pet Talk lets users select Piper Plus voice models. Each voice model may have its own license and usage terms. Before use, check the model card and the provider's terms.

## Tsukuyomi-chan Voice Model

The following Piper Plus Tsukuyomi-chan voice model can also be prepared by the user and selected in the app.

- Piper Plus Tsukuyomi-chan: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json
- Tsukuyomi-chan corpus terms: https://tyc.rei-yumesaki.net/material/corpus/
- Tsukuyomi-chan character license: https://tyc.rei-yumesaki.net/about/terms/

The first setup example still uses `piper-plus-css10-ja-6lang`. If you use the Tsukuyomi-chan voice model, review the model card and the Tsukuyomi-chan terms before configuring it.
Users who do not redistribute the model should also review the user-facing conditions in the Tsukuyomi-chan corpus terms.
The Tsukuyomi-chan corpus terms require credit. If you publish, distribute, or post videos using generated voice, include the required credit according to the terms.

In the app, select `tsukuyomi-chan-6lang-fp16.onnx` for `Piper Plus model (.onnx)` and `config.json` for `Piper Plus config (.json)`. On iPhone Safari, if `config.json` opens as text, open the Hugging Face `raw` view, long-press the displayed page, and choose `Download Linked File`.

## Prohibited Uses of Generated Voice

When using a Tsukuyomi-chan voice model, do not use generated voice for the following purposes:

- Criticizing or attacking people.
- Calling for support for, or opposition to, a specific political position, religion, or ideology.
- Publishing intense expressions without appropriate zoning or access control.
- Publishing the generated voice in a way that permits others to reuse it as source material.

The definition of criticizing or attacking people follows condition3 of the Tsukuyomi-chan character license.

https://tyc.rei-yumesaki.net/about/terms/#condition3

## LLM Output

LLMs may produce unexpected output. If an inappropriate utterance is generated accidentally, do not use, consume, or spread it for the prohibited purposes above.

Before TTS synthesis, the app may apply lightweight vocabulary rules and skip audio synthesis when text may match restricted usage. This is a supplemental safeguard and does not replace checking the terms or making appropriate user-side judgments.
