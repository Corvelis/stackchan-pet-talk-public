# Third-Party Licenses and Notices

This file records third-party software, model, dictionary, and runtime
components included or used by StackChan Pet Talk limited beta builds.

The app source code is licensed under the Apache License, Version 2.0. See
`LICENSE` and `NOTICE`.

## Bundled Models, Dictionaries, and Runtimes

The limited beta build may bundle the files listed in
`distribution/model_manifest.yaml`. That manifest records file paths, sizes,
SHA-256 hashes, source URLs, license names, and bundle status.

Approved bundled beta groups:

- ReazonSpeech k2 v2 ONNX models: Apache-2.0
- Silero VAD ONNX model: MIT
- OpenCV YuNet/SFace ONNX models: Apache-2.0
- CAM++ / 3D-Speaker speaker embedding model: Apache-2.0
- OpenJTalk UTF-8 dictionary 1.11: BSD-style notices from OpenJTalk, MeCab,
  NAIST, and UniDic
- Piper Plus multilingual dictionary data: MIT-compatible Piper Plus /
  piper-plus-g2p attribution
- LiteRT-LM Android and iOS runtime libraries: Apache-2.0

The LiteRT-LM Android local extra libraries listed as `excluded` in the
manifest are local staging files and are not intended to be included in beta
builds.

## App and Framework Dependencies

Flutter and Dart package licenses are displayed through Flutter's built-in
license registry. CocoaPods and Gradle dependencies must also be reviewed from
their resolved dependency metadata before public distribution.

The whisper.cpp server integration is an optional feature that calls an
external server started separately by the user. Unless this app bundles
whisper.cpp itself, whisper.cpp binaries, or whisper.cpp model files, those
components are not app-bundled materials and are not included in this app's
bundled license display. Users who install a separate whisper.cpp server and
models should review the licenses from those upstream distributions.

Known runtime or native dependencies include:

- Flutter and Dart packages from `pubspec.yaml`
- CocoaPods dependencies from `ios/Podfile.lock`
- Android Gradle dependencies from `android/app/build.gradle.kts`
- ONNX Runtime: MIT
- OpenCV: Apache-2.0
- DKImagePickerController / DKPhotoGallery / SDWebImage / SwiftyGif: MIT
- AndroidX Concurrent Futures: Apache-2.0
- llama.cpp / ggml: MIT
- nlohmann/json: MIT
- utf8-cpp: permissive license by Nemanja Trifunovic
- WORLD: modified BSD

## Model and Runtime Attribution

ReazonSpeech k2 v2:

- Source: https://research.reazon.jp/blog/2024-08-01-ReazonSpeech.html
- License: Apache-2.0
- Purpose: local Japanese ASR

Silero VAD:

- Source: https://github.com/snakers4/silero-vad
- License: MIT
- Purpose: local voice activity detection

OpenCV YuNet and SFace:

- Source: https://github.com/opencv/opencv_zoo
- License: Apache-2.0
- Purpose: local face detection and face embedding

CAM++ / 3D-Speaker:

- Source: https://www.modelscope.cn/models/iic/speech_campplus_sv_zh_en_16k-common_advanced
- ONNX mirror: https://huggingface.co/csukuangfj/speaker-embedding-models
- Upstream project: https://github.com/modelscope/3D-Speaker
- License: Apache-2.0
- Purpose: local speaker embedding and master voice recognition

OpenJTalk dictionary:

- Source: https://sourceforge.net/projects/open-jtalk/files/Dictionary/open_jtalk_dic-1.11/
- License: BSD-style notices from OpenJTalk, MeCab, NAIST, and UniDic
- Purpose: Japanese text frontend dictionary

Piper Plus:

- Source: https://github.com/ayutaz/piper-plus
- License: MIT
- Purpose: local TTS and multilingual G2P/dictionary data

WORLD:

- Source: https://github.com/mmorise/World
- License: modified BSD
- Purpose: optional robot-style voice processing for Piper Plus

LiteRT-LM:

- Source: https://github.com/google-ai-edge/LiteRT-LM
- License: Apache-2.0
- Purpose: local LLM runtime

ONNX Runtime:

- Source: `com.microsoft.onnxruntime:onnxruntime-android` and `onnxruntime-c`
- License: MIT
- Purpose: ONNX model runtime for local ASR, VAD, face/voice recognition, and TTS support

OpenCV:

- Source: `org.opencv:opencv` and `OpenCV2_MT`
- License: Apache-2.0
- Purpose: face detection and face embedding runtime

iOS file picker native dependencies:

- Source: `DKImagePickerController`, `DKPhotoGallery`, `SDWebImage`, and `SwiftyGif` from `ios/Podfile.lock`
- License: MIT
- Purpose: iOS file selection/photo gallery support used by file picking flows

AndroidX Concurrent Futures:

- Source: `androidx.concurrent:concurrent-futures`
- License: Apache-2.0
- Purpose: Android concurrency support for native/platform integrations
