# Getting Started

[Back to README](../../README_en.md) | [日本語](../ja/getting-started.md)

This guide is for first-time testers of StackChan Pet Talk.

## 1. Requirements

- A Stack-chan device
- `stackchan-pet-fw`
- An iPhone or Android phone
- Wi-Fi where the phone can reach Stack-chan, Stack-chan SoftAP, or USB Serial on Android
- For local conversation, a LiteRT-LM `.litertlm` or llama.cpp `.gguf` model file
- For Piper Plus speech output, a `.onnx` voice model and matching `.json` config file

Compatible firmware:

https://github.com/Corvelis/stackchan-pet-fw

The developer mainly tests with:

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## 2. Install the App

For iPhone:

1. Open [iPhone / TestFlight Beta](ios-testflight.md).
2. Install the TestFlight app.
3. Open the shared TestFlight link.
4. Install `StackChan Pet Talk`.

For Android:

1. Open [Android Beta](android-beta.md).
2. Join the Android beta Google Group.
3. Open the Google Play test opt-in link.
4. Tap `Become a tester`.
5. Install `StackChan Pet Talk` from Google Play.

## 3. Prepare Stack-chan

1. Install `stackchan-pet-fw` on the Stack-chan device.
2. Start the device.
3. Make sure your phone can reach it.

Common connection modes:

| Mode | Description |
| --- | --- |
| SoftAP | Connect your phone to Stack-chan Wi-Fi. The usual Host is `192.168.4.1`, and the usual Port is `8080`. |
| Wi-Fi IP | Connect Stack-chan and your phone to the same Wi-Fi network, then enter the Stack-chan IP address. |
| USB Serial (Android only) | Connect a compatible Stack-chan to the Android phone with USB. The Port field is the baud rate, usually `921600`. |

## 4. Connect from the App

1. Launch `StackChan Pet Talk`.
2. Choose the connection mode.
3. Under `Character mode`, choose `Shared` to use one character with every Stack-chan, or `Per device` to keep a separate character for each device.
4. Check Host and Port.
5. Tap `Connect`.
6. When the connection succeeds, the app opens the conversation screen.

Without a reachable Stack-chan device, the app cannot proceed to the main conversation screen.

## 5. Prepare a Local LLM

To test local conversation, prepare a LiteRT-LM model file first.

You can also use a llama.cpp GGUF model. For either LiteRT-LM or llama.cpp, the selected model is imported into app-managed storage. See [Model, Dictionary, and Runtime Downloads](model-downloads.md) for the differences and llama.cpp setup.

Recommended first model:

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- File to select: `gemma-4-E2B-it.litertlm`
- Direct download: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

Notes:

- The app's LiteRT-LM settings select a `.litertlm` file.
- `.task` files are not selectable here.
- `gemma-4-E2B-it-web.litertlm` is not the usual choice for the mobile app.
- The file may be large. Downloading on a PC and moving it to the phone through AirDrop, iCloud Drive, USB, Google Drive, or a similar method is often easier.

Example iPhone location:

```text
Files app
  On My iPhone or iCloud Drive
    StackChanPetTalk/
      llm/
        gemma-4-E2B-it.litertlm
```

Example Android location:

```text
Files or Downloads
  StackChanPetTalk/
    llm/
      gemma-4-E2B-it.litertlm
```

App settings:

1. Open `Settings` from the conversation screen or settings icon.
2. Open `LLM`.
3. Select `LiteRT-LM` as the provider.
4. Select `gemma-4-E2B-it.litertlm` from `LiteRT-LM model file (.litertlm)`.
5. Keep the default settings at first.
6. Tap the `Warm up` button to confirm that the model loads.

For details and model notes, see [Model, Dictionary, and Runtime Downloads](model-downloads.md).

## 6. Prepare Piper Plus TTS

To hear replies from Stack-chan, prepare a Piper Plus voice model.

First example when testing from a phone only:

- Repository: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json

On iPhone Safari, open `config.json` through Hugging Face `raw` so the JSON text is displayed, then long-press the displayed page and choose `Download Linked File`. A normal tap may only display the JSON text, so use the long-press action to save the file.

If you can prepare files on a PC with the Piper Plus command:

- Piper Plus base model: https://huggingface.co/ayousanz/piper-plus-base
- Piper Plus download command: `piper --download-model base`

Additional available model:

- Piper Plus Tsukuyomi-chan: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan
- `.onnx`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/tsukuyomi-chan-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-tsukuyomi-chan/resolve/main/config.json

If you use the Tsukuyomi-chan voice model, review [Voice Model Usage Notes](voice-model-terms.md) and the provider's terms.

Required files:

- `.onnx` voice model
- Matching `.json` or `.onnx.json` config file

Example iPhone location:

```text
Files app
  On My iPhone or iCloud Drive
    StackChanPetTalk/
      piper-plus/
        css10-ja-6lang-fp16.onnx
        config.json
```

Example Android location:

```text
Files or Downloads
  StackChanPetTalk/
    piper-plus/
      css10-ja-6lang-fp16.onnx
      config.json
```

App settings:

1. Open `Settings > Voice AI`.
2. Select `Piper Plus` as the `TTS engine`.
3. Select `css10-ja-6lang-fp16.onnx` from `Piper Plus model (.onnx)`.
4. Select `config.json` from `Piper Plus config (.json)`.
5. Check `Warmup text`, then tap `Warm up TTS` to confirm audio output.

If you cannot find the downloaded file on iPhone, check `Files > iCloud Drive > Downloads` or `Files > On My iPhone > Downloads`. If the file is named `config.json.txt` or `config.json.download`, long-press it, choose rename, and change the name to `config.json`.

Notes:

- Piper Plus voice models have model-specific licenses and terms.
- When testing from a phone only, start with the `.onnx` and `config.json` pair listed above.
- If you can prepare files on a PC, you can also use `piper-plus-base` with `piper --download-model base`.
- If you use a character-specific voice such as Tsukuyomi-chan, check the model provider's terms and [Voice Model Usage Notes](voice-model-terms.md) first.
- Enable `Robot-style voice` to process the synthesized voice with adjustable speed, base F0, and intonation.

For download details, see [Model, Dictionary, and Runtime Downloads](model-downloads.md).

### Using Style-Bert-VITS2 on iPhone

On iPhone, the app can run a converted Style-Bert-VITS2 model on the device. In `Settings > Voice AI`, select `Style-Bert-VITS2 (iPhone CoreML)` as the TTS engine, then separately select the BERT folder and VITS2 folder prepared by the distributor.

This does not accept an ordinary distributed model as-is. It requires a model package already converted to the supported split ONNX / Core ML format. See [Model, Dictionary, and Runtime Downloads](model-downloads.md) for details.

## 7. Start Testing

When the connection succeeds, the app opens the conversation screen. After LLM and TTS are configured, return from settings to the conversation screen and test there. Start with text conversation first.

1. Type a short message in the input field at the bottom of the conversation screen.
2. Tap the send button.
3. Check whether the reply appears in the conversation history.
4. If TTS is enabled, check whether Stack-chan plays the reply audio.

When using an image-capable LLM, use the image attachment button beside the input field to choose the phone camera, photo library, or a compatible Stack-chan camera. The image is attached to the next message.

Recommended first messages:

```text
Hello
How are you today?
Introduce yourself
```

Try voice conversation after text conversation works.

1. Open `Settings > Voice AI`.
2. Check ASR and TTS settings. Confirm that the Piper Plus model and config files are selected.
3. Return to the conversation screen.
4. Tap the microphone button at the bottom of the screen.
5. When speech input starts, speak to Stack-chan.
6. Check the speech recognition result, the LLM reply, and the reply audio from Stack-chan.

Voice conversation requires both app-side voice settings and Stack-chan-side microphone/speaker integration.

## 8. Full User Guide

Detailed screen descriptions, Voice AI, LLM, character settings, and master recognition are covered in the [Full User Guide](user-manual.md).

- To speak stopwatch and Pomodoro events from compatible devices: [Time Announcements](timekeeper.md)
- To use a Hermes API server for conversation: [Using Hermes Agent](hermes-agent.md)

## 9. If Something Does Not Work

If connection, conversation, or audio does not work, see [Troubleshooting](troubleshooting.md).
