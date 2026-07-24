# サードパーティライセンスと通知

この文書は、StackChan Pet Talk の限定ベータビルドに含まれる、または利用されるサードパーティソフトウェア、モデル、辞書、ランタイムを記録するものです。

アプリ本体のソースコードは Apache License, Version 2.0 でライセンスされています。`LICENSE` と `NOTICE` を参照してください。

## 同梱モデル、辞書、ランタイム

限定ベータビルドには、`distribution/model_manifest.yaml` に記載されたファイルが同梱される場合があります。この manifest には、ファイルパス、サイズ、SHA-256、配布元 URL、ライセンス名、同梱ステータスを記録しています。

限定ベータで同梱可としているグループ:

- ReazonSpeech k2 v2 ONNX models: Apache-2.0
- Silero VAD ONNX model: MIT
- OpenCV YuNet/SFace ONNX models: Apache-2.0
- CAM++ / 3D-Speaker speaker embedding model: Apache-2.0
- OpenJTalk UTF-8 dictionary 1.11: OpenJTalk、MeCab、NAIST、UniDic の BSD 系通知
- Piper Plus multilingual dictionary data: MIT 互換の Piper Plus / piper-plus-g2p 帰属表示
- LiteRT-LM Android and iOS runtime libraries: Apache-2.0

manifest で `excluded` になっている LiteRT-LM Android local extra libraries はローカル作業用のファイルであり、ベータビルドには含めない想定です。

## アプリとフレームワーク依存

Flutter と Dart package のライセンスは、Flutter 標準のライセンスレジストリを通じて表示されます。CocoaPods と Gradle の依存関係についても、公開配布前には解決済み依存メタデータから確認してください。

whisper.cpp server 連携は、ユーザーが別途起動した外部サーバーの API を呼び出す任意機能です。このアプリに whisper.cpp 本体、whisper.cpp のバイナリ、または whisper.cpp 用モデルを同梱しない限り、それらはこのアプリの同梱物ではなく、同梱ライセンス表示の対象には含めません。ユーザーが別途導入する whisper.cpp server とモデルについては、それぞれの配布元ライセンスを確認してください。

主なランタイムまたはネイティブ依存:

- `pubspec.yaml` の Flutter / Dart package
- `ios/Podfile.lock` の CocoaPods dependencies
- `android/app/build.gradle.kts` の Android Gradle dependencies
- ONNX Runtime: MIT
- OpenCV: Apache-2.0
- DKImagePickerController / DKPhotoGallery / SDWebImage / SwiftyGif: MIT
- AndroidX Concurrent Futures: Apache-2.0
- llama.cpp / ggml: MIT
- nlohmann/json: MIT
- utf8-cpp: Nemanja Trifunovic による permissive license
- WORLD: modified BSD

## モデルとランタイムの帰属表示

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
- License: OpenJTalk、MeCab、NAIST、UniDic の BSD 系通知
- Purpose: Japanese text frontend dictionary

Piper Plus:

- Source: https://github.com/ayutaz/piper-plus
- License: MIT
- Purpose: local TTS and multilingual G2P/dictionary data

WORLD:

- Source: https://github.com/mmorise/World
- License: modified BSD
- Purpose: Piper Plus の任意のロボット風ボイス処理

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
