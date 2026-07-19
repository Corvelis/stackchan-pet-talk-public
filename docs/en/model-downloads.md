# Model, Dictionary, and Runtime Downloads

Japanese: [model-downloads.md](../ja/model-downloads.md)

Git-tracked source does not include user-selected voice models, local LLM
models, SDK drops, or arbitrary prebuilt binaries. Limited beta builds only
bundle models, dictionaries, and runtime files approved in
`distribution/model_manifest.yaml`.

This document separates two kinds of files:

- Files users prepare separately and select from the app settings
- Files that may be bundled in beta distribution builds

If you received the app through TestFlight and are using it for the first time,
start with [getting-started.md](getting-started.md). This document supplements
that guide with model file sources, filenames, and notes.

Before adding any new file to a distributed build, record its source URL,
license, file size, SHA-256, and whether it is bundled or user-selected.
Do not add it to a release build until `distribution/model_manifest.yaml` and
license notices are updated.

## Files Users Prepare At Runtime

This is the important section for normal users and beta testers. These files
are separate from recognition models bundled into the app, and are selected
from the app settings.

You do not need to download the GitHub source code. Download model files from
Safari, a PC, or a shared link from the distributor, save them to the iPhone
`Files` app, and then select them in the app settings.

When downloading from Hugging Face, open the target file from `Files and
versions`, then download it. Large GGUF or `.litertlm` files can take a long
time to handle on iPhone alone, so downloading on a PC and transferring via
AirDrop, iCloud Drive, USB, or a distributor-provided model pack is more
reliable.

### Piper Plus TTS Voice Model

Use this when:

- `Settings > Voice AI > TTS engine > Piper Plus`

Required files:

- `.onnx` voice model
- matching `.json` or `.onnx.json` config file

Normal starting points:

- Phone-only test example: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json
- Piper Plus base model: https://huggingface.co/ayousanz/piper-plus-base
- Piper Plus download command: `piper --download-model base`
- Piper Plus Tsukuyomi-chan: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- Tsukuyomi-chan `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- Tsukuyomi-chan `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json

On iPhone Safari, tapping a `.json` file may show the JSON contents instead of
downloading it. If that happens, open the JSON through Hugging Face `raw`, long
press the page, and choose `Download Linked File`.

Example placement:

```text
models/
  piper-plus/
    css10-ja-6lang-fp16.onnx
    config.json
```

After file selection, the app imports the model and config file into app-managed
storage. Even if the original file is moved or deleted, the imported copy is
used. The TestFlight version works the same way. Select `Piper Plus` from
`Settings > Voice AI`, then select the `.onnx` and `.json` files.

Notes:

- Piper Plus runtime and voice models have separate licenses.
- The `piper-plus-base` model card currently shows CC-BY-4.0.
- For character voices or specific-speaker models, always review the model card
  and distributor terms.
- The first example uses `piper-plus-css10-ja-6lang`, but users can also prepare
  and use Tsukuyomi-chan voice models.
- When using Tsukuyomi-chan voice models, review
  [Voice Model Usage Notes](voice-model-terms.md) and the distributor terms.

Japanese OpenJTalk-based models also require an OpenJTalk dictionary.

- OpenJTalk UTF-8 dictionary 1.11:
  https://sourceforge.net/projects/open-jtalk/files/Dictionary/open_jtalk_dic-1.11/open_jtalk_dic_utf_8-1.11.tar.gz/download

Example placement for development/builds:

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

In the TestFlight version, testers normally do not select the OpenJTalk
dictionary from the UI. If you recommend a Japanese OpenJTalk-based Piper Plus
model, the distributor should either provide a build with the dictionary bundled
or clearly state that the voice cannot be used without the dictionary.

### Style-Bert-VITS2 (iPhone / Core ML)

Use this when:

- `Settings > Voice AI > TTS engine > Style-Bert-VITS2`

Required files:

- A converted and split BERT folder for Core ML
- A converted and split VITS2 voice folder for Core ML

In the app, use `BERT folder` and `VITS2 folder` to select the two folders
separately. If the VITS2 folder contains multiple speakers or styles, you can
choose the voice, speaker, style, and speech speed after import.

An ordinary Style-Bert-VITS2 model cannot be selected as-is. The distributor
must first convert it to the Core ML format supported by the iPhone
implementation and prepare the required BERT and VITS2 files as folders. The app
does not download or convert these models.

Licenses and speaker or character usage terms vary by model. Before distribution
or use, review the source model card, voice usage terms, and redistribution terms.

### LiteRT-LM Local LLM

Use this when:

- `Settings > LLM > Provider > LiteRT-LM`

Required file:

- `.litertlm` model file

Starting point for Gemma 4 E2B:

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- Normal file to choose: `gemma-4-E2B-it.litertlm`
- Direct download: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

Notes:

- The current app implementation only allows `.litertlm`.
- `.task` files are not selectable in this app's LiteRT-LM settings screen.
- `gemma-4-E2B-it-web.litertlm` is for web use. Do not normally choose it for
  the mobile app.
- `*_intel_*` and `*_qualcomm_*` files for Intel/Qualcomm NPU should only be
  considered when the target runtime and hardware match.
- Always review the model page license and terms before distribution.
- The LiteRT-LM Android / iOS runtime must be included in the app build. Adding
  only a `.litertlm` file is not enough if the runtime is not present.

Example placement:

```text
models/
  llm/
    gemma-4-E2B-it.litertlm
```

Select this `.litertlm` file from the settings screen, then adjust CPU/GPU,
max tokens, temperature, topK, topP, context size, batch size, and thread count
as needed.

In the TestFlight version, choose `LiteRT-LM` from `Settings > LLM`, then select
this file from `LiteRT-LM model file (.litertlm)`.

The selected model is imported into app-managed storage. After import completes,
the app uses its copy even if the original file is moved or deleted.

### llama.cpp Local LLM

Use this when:

- `Settings > LLM > Provider > llama.cpp`

Required file for text conversation:

- Main `.gguf` model file

Additional file for image/VLM use:

- `mmproj*.gguf` from the same model family, distributor, and revision

Gemma 4 E2B GGUF example:

- Repository: https://huggingface.co/batiai/gemma-4-E2B-it-GGUF
- Text model example: `google-gemma-4-E2B-it-Q4_K_M.gguf`
- VLM projector example: `mmproj-BF16.gguf`

Example placement:

```text
models/
  llm/
    gemma-4-E2B-it/
      google-gemma-4-E2B-it-Q4_K_M.gguf
      mmproj-BF16.gguf
```

How to choose:

- For text only, the `.gguf` file is enough.
- For image questions, OCR, or image description, also select `mmproj*.gguf`.
- Do not mix the main GGUF and mmproj from different models or revisions.
- In the TestFlight version, choose `llama.cpp` from `Settings > LLM`, then
  select `GGUF model file` and `mmproj` if needed.
- The selected GGUF and mmproj are imported into app-managed storage.

For a supported gpt-oss Flash MoE format on iPhone, select the main GGUF first, then select the
corresponding layer-pack folder. The folder must contain all 24 files from
`.layer00.pack` through `.layer23.pack`, created from the same model. If the app
reports missing layers, select a complete pack again, and do not mix layers from
different models or revisions.

`Clear imported LLM files` removes the model copies and saved selections from
app-managed storage. It does not delete the original downloaded files.

Notes:

- GGUF conversions may be community-provided.
- Check the upstream model license, conversion source, quantization conditions,
  and commercial-use terms.
- On smartphones, starting with a smaller Q4 quantization is practical.
- Large GGUF or mmproj files can cause memory issues or slow first loads.

### Cloud API / PC Server

The following do not require model files inside the app:

- OpenAI API
- Gemini API
- OpenAI compatible API
- OpenAI transcription API
- OpenAI TTS API
- Irodori TTS server
- whisper.cpp server

You need a Base URL, model name, API key, or PC-side server configuration.
When connecting from a real smartphone to a server running on your PC,
`localhost` points to the smartphone itself. Use the PC's LAN IP address.

Examples:

```text
http://192.168.0.10:8080/v1
http://192.168.0.10:8090
http://192.168.0.10:8088/v1
```
