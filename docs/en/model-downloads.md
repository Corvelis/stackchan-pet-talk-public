# Model Downloads

Japanese: [model-downloads.md](../ja/model-downloads.md)

Git-tracked source does not include user-provided voice models, local LLM
models, SDK drops, or arbitrary prebuilt binaries. Limited beta builds may
bundle only the approved model, dictionary, and runtime files recorded in
`distribution/model_manifest.yaml`.

Use this file when you need to prepare local development files, verify beta
bundle contents, or tell testers where a separately provided model came from.

Quick checklist:

- ReazonSpeech ASR
- Silero VAD
- Piper Plus TTS voices
- OpenJTalk dictionary for Japanese Piper Plus models
- llama.cpp local LLMs
- LiteRT-LM CPU/GPU models
- Master face recognition
- Master voice recognition

For every downloaded file, record the source URL, license, file size, SHA-256,
and whether it is bundled or user-selected. Do not add a new file to a release
build until `distribution/model_manifest.yaml` and the license notices are
updated.

## User-Selected Files Needed At Runtime

These files are not the same as the beta-bundled ASR/VAD/recognition assets.
They are files a user or tester may need to download and select in the app
settings.

### Piper Plus TTS voice files

Use this when `Settings > Voice AI > TTS engine > Piper Plus` is selected.

Required files:

- `.onnx` voice model
- matching `.json` or `.onnx.json` config file

Normal starting point:

- Phone-only test example: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json
- Piper Plus base model: https://huggingface.co/ayousanz/piper-plus-base
- Command documented by Piper Plus: `piper --download-model base`
- Piper Plus Tsukuyomi-chan: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- Tsukuyomi-chan `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- Tsukuyomi-chan `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json

On iPhone Safari, tapping a `.json` file may display the JSON text instead of
downloading it. Open the file through Hugging Face `raw`, then long-press the
displayed JSON page and choose `Download Linked File`.

The Piper Plus runtime and the selected voice model can have different
licenses. Check the model card before using or redistributing a voice. The base
model page currently lists CC-BY-4.0; character voices can have additional
terms. The first example uses `piper-plus-css10-ja-6lang`, but Tsukuyomi-chan
voice models can also be prepared by the user and used in the app. If you use
one, review [Voice Model Usage Notes](voice-model-terms.md) and the
provider's terms.

### LiteRT-LM local LLM files

Use this when `Settings > LLM > Provider > LiteRT-LM` is selected.

Required file:

- `.litertlm` model file

Recommended Gemma 4 E2B starting point for the current app:

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- General file: `gemma-4-E2B-it.litertlm`
- Direct download: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

The current app accepts `.litertlm` only. Do not select `.task` files, and do
not use the `*-web.litertlm` or hardware-specific Intel/Qualcomm NPU variants
unless you know that target matches your runtime. Check the Hugging Face model
card for current license and terms before redistribution.

### llama.cpp local LLM files

Use this when `Settings > LLM > Provider > llama.cpp` is selected.

Text-only required file:

- main `.gguf` model file

Image/VLM optional file:

- matching `mmproj*.gguf` file from the same model family/repository/revision

Example Gemma 4 E2B GGUF repository:

- https://huggingface.co/batiai/gemma-4-E2B-it-GGUF
- text model example: `google-gemma-4-E2B-it-Q4_K_M.gguf`
- multimodal projector example: `mmproj-BF16.gguf`

GGUF conversions are often community-provided. Use a trusted repository, keep
the main GGUF and mmproj from the same source, and check the upstream model
license and conversion notes before use.

### Cloud API providers

OpenAI, Gemini, OpenAI compatible API, OpenAI transcription, OpenAI TTS, and
Irodori TTS server do not require model files inside this app. They require the
right Base URL, model name, and API key or server configuration.

## Beta-Bundled Assets

These are files that may be embedded into a TestFlight or Google Play beta
build when `distribution/model_manifest.yaml` approves them. Normal
testers do not download these manually unless the distributor gives them a
separate model pack.

- ReazonSpeech ASR and Silero VAD
- OpenCV YuNet/SFace face models
- CAM++ / 3D-Speaker voice model
- Piper Plus multilingual dictionary data
- OpenJTalk UTF-8 dictionary
- LiteRT-LM mobile runtime libraries

## Piper Plus TTS

Piper Plus voice models are not included in this repository. Do not commit
model files, SDKs, or prebuilt binaries.

For general setup, start with the phone-friendly `piper-plus-css10-ja-6lang`
example above, or use the Piper Plus base model (`piper-plus-base`, download
name `base`) when preparing files on a PC. Character-specific voices such as
Tsukuyomi-chan can also be used when the user has reviewed the model card,
[Voice Model Usage Notes](voice-model-terms.md), and provider terms.

The upstream Piper Plus package lists `piper-plus-base` as the 6-language base
model (`ja/en/zh/es/fr/pt`) and downloads it with:

```sh
piper --download-model base
```

Source and documentation:

- Piper Plus: https://github.com/ayutaz/piper-plus
- OpenJTalk UTF-8 dictionary 1.11: https://sourceforge.net/projects/open-jtalk/files/Dictionary/open_jtalk_dic-1.11/open_jtalk_dic_utf_8-1.11.tar.gz/download

Do not present third-party character voices as the simplest first setup path.
They can be used when the user has reviewed and accepted the model-specific
terms.

Place user-provided Piper Plus files outside Git-tracked source, for example:

```text
models/
  piper-plus/
    voice.onnx
    voice.onnx.json
  openjtalk/
    open_jtalk_dic_utf_8-1.11/
      char.bin
      matrix.bin
      sys.dic
      unk.dic
```

The app settings need:

- Piper Plus model path (`.onnx`)
- Piper Plus config path (`.json`)
- OpenJTalk dictionary directory when using OpenJTalk Japanese models

OpenJTalk dictionaries are not committed to this repository. Local development
builds can bundle a dictionary from `models/openjtalk/open_jtalk_dic_utf_8-1.11/`
when that directory exists on the build machine. `models/` remains ignored by
Git, so CI/release environments must provision the same files before building
or use a future download flow.

For Japanese OpenJTalk-based Piper Plus models, download the UTF-8 dictionary
from the official Open JTalk SourceForge distribution:

```text
https://sourceforge.net/projects/open-jtalk/files/Dictionary/open_jtalk_dic-1.11/open_jtalk_dic_utf_8-1.11.tar.gz/download
```

Extract it into `models/openjtalk/open_jtalk_dic_utf_8-1.11/` before local
builds. When Piper Plus is used, the app copies the bundled dictionary to the
app support directory automatically before native initialization. The
dictionary is BSD-style licensed; keep the license text from the downloaded
archive when redistributing an app package that includes it.

`models/` is intentionally ignored by Git. Users are responsible for checking
the model source, license, platform support, and storage size before use.

For Stack-chan speaker output, the app converts generated Piper Plus audio to:

- 16 kHz
- mono
- signed 16-bit little endian PCM
- raw binary chunks over the Stack-chan WebSocket

WAV headers are not sent to Stack-chan. If Piper Plus returns WAV audio, the
app extracts the `data` chunk, downmixes/resamples when needed, and sends only
raw PCM16 bytes. Generated audio files and model files are not committed to
this repository.

## ReazonSpeech ASR and Silero VAD

ReazonSpeech and Silero VAD models are not included in this repository. Do not
commit ASR models, SDKs, or prebuilt binaries.

Approved beta bundles may include the exact files listed in
`distribution/model_manifest.yaml`. For public release or a fresh model pack,
pin exact source revisions or direct download URLs before distribution.

Known source/download entry points:

- ReazonSpeech k2 v2 announcement and license note: https://research.reazon.jp/blog/2024-08-01-ReazonSpeech.html
- sherpa-onnx Silero VAD download page: https://k2-fsa.github.io/sherpa/onnx/vad/silero-vad.html
- sherpa-onnx Silero VAD direct file commonly used by sherpa-onnx:
  https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/silero_vad.onnx

Place user-provided files outside Git-tracked source, for example:

```text
models/
  reazonspeech/
    encoder-epoch-35-avg-1.int8.onnx
    decoder-epoch-35-avg-1.int8.onnx
    joiner-epoch-35-avg-1.int8.onnx
    tokens.txt
  silero-vad/
    silero_vad.onnx
```

These files are copied into the app bundle at build time when present. The app
then copies them to the app support directory before initializing `sherpa_onnx`.
The settings screen only exposes the VAD silence duration; model paths are not
user-selectable.

The ASR flow assumes Stack-chan mic input is raw 16 kHz mono signed 16-bit
little endian PCM from the WebSocket. The app runs Silero VAD first, then sends
the detected speech segment to ReazonSpeech through `sherpa_onnx`.

`models/` is intentionally ignored by Git. Users are responsible for checking
the model source, license, platform support, and storage size before use.

Download flows must make the following clear:

- Model source and license
- Required storage size
- Supported platform and acceleration path
- Whether data remains local
- How to remove downloaded files

Master recognition models are for optional local-only character interaction. They are not security or access-control mechanisms.

## Master Recognition Models

Master recognition is an optional local-only character interaction feature. It
is not authentication, login, or access control.

Face recognition uses OpenCV YuNet and SFace model files when the platform
native bridge is available:

```text
models/
  face/
    face_detection_yunet_2023mar.onnx
    face_recognition_sface_2021dec.onnx
```

Voice recognition uses the CAM++ speaker embedding model through
`sherpa_onnx`:

```text
models/
  camplusplus/
    3dspeaker_speech_campplus_sv_zh_en_16k-common_advanced.onnx
```

Known source/download entry points:

- OpenCV Zoo YuNet model directory: https://github.com/opencv/opencv_zoo/tree/main/models/face_detection_yunet
- OpenCV Zoo SFace model directory: https://github.com/opencv/opencv_zoo/tree/main/models/face_recognition_sface
- CAM++ / 3D-Speaker upstream model: https://www.modelscope.cn/models/iic/speech_campplus_sv_zh_en_16k-common_advanced
- CAM++ ONNX mirror used for the beta manifest:
  https://huggingface.co/csukuangfj/speaker-embedding-models/blob/main/3dspeaker_speech_campplus_sv_zh_en_16k-common_advanced.onnx

These files are copied into the app bundle at build time when present, then
copied to the app support directory before native/sherpa initialization.
`models/` is ignored by Git, so local development and release builds must
provision these files before building. Store only embeddings in app settings;
do not store captured face images or raw voice audio.

## llama.cpp GGUF models

llama.cpp GGUF models are not included in this repository. Do not commit GGUF
files, SDKs, or prebuilt binaries.

Place user-provided GGUF files outside Git-tracked source, for example:

```text
models/
  llm/
    your-model.gguf
```

The LLM settings screen stores the selected GGUF file path. The app validates
that the path is non-empty, exists, is not empty, has a `.gguf` extension, and
starts with the `GGUF` header before attempting to initialize llama.cpp.

`models/` is intentionally ignored by Git. Users are responsible for checking
each model's source, license, platform support, memory requirements, and
commercial-use terms before use.

The current llama.cpp phase adds the Dart-side client, provider switch,
settings, prompt templates, and MethodChannel bridge wrapper. Native bridge
build inputs must remain source-based or externally provisioned; prebuilt
binary drops are not committed to this repository.

## LiteRT-LM local models

LiteRT-LM user models are not included in this repository. Do not commit
`.litertlm` files, SDKs, or prebuilt binaries.

Place user-provided LiteRT-LM files outside Git-tracked source, for example:

```text
models/
  llm/
    your-model.litertlm
```

The LLM settings screen stores the selected model file path. The app validates
that the path is non-empty, exists, is not empty, and has a `.litertlm`
extension before attempting native initialization. `.task` files are not
accepted by the current Flutter settings screen or Dart client validation.

The initial StackChan Pet Talk LiteRT-LM integration supports CPU and GPU
backends only. NPU, QNN, QAIRT, SM8750-specific runtimes, multimodal input,
speculative decoding, and model auto-download are intentionally out of scope.

On iOS, LiteRT-LM also needs the LiteRT-LM runtime dylib xcframeworks to be
available at build time:

```text
native/
  llama_bridge/
    ios/
      lib/
        litert_lm/
          libLiteRtLmC.xcframework/
          libGemmaModelConstraintProvider.xcframework/
          libLiteRtMetalAccelerator.xcframework/
          libLiteRtTopKMetalSampler.xcframework/
```

These runtime binaries are intentionally ignored by Git. Local builds can copy
them from a locally provisioned LiteRT-LM iOS distribution before running
`pod install` or `flutter build ios`. Release and CI environments must provision
the same runtime files separately and follow the upstream LiteRT-LM license and
redistribution terms.

Source:

- LiteRT-LM: https://github.com/google-ai-edge/LiteRT-LM

`models/` is intentionally ignored by Git. Users are responsible for checking
each model's source, license, platform support, memory requirements, and
commercial-use terms before use.
