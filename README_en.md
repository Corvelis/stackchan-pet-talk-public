# StackChan Pet Talk

[日本語](README.md) | English

StackChan Pet Talk is a beta mobile app for talking with a Stack-chan device running `stackchan-pet-fw`.

## Join the Beta

### iPhone / TestFlight

TestFlight public link:

https://testflight.apple.com/join/Tt1Z4xpT

See [iPhone / TestFlight Beta](docs/en/ios-testflight.md) for the installation steps.

### Android

The Android beta is distributed through Google Play open testing. No Google
Group membership or individual approval is required.

Test opt-in link:

https://play.google.com/apps/testing/app.stackchan.pet.talk

Google Play store page:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

See [Android Beta](docs/en/android-beta.md) for the installation steps.

## Latest Update

Version `1.0.6 (48)` adds StopWatch remote capture with the phone camera,
local VLM image preprocessing and KV caching, and faster streaming chat
updates. Compatible Qualcomm Adreno devices can use the OpenCL GPU backend on
Android, while iOS adds Metal processing support for TQ2_0 quantized models.

See the [Release Notes](docs/en/release-notes.md) for details.

## Requirements

- A Stack-chan device
- `stackchan-pet-fw`
- An iPhone or Android phone
- Wi-Fi where the phone can reach Stack-chan, Stack-chan SoftAP, or USB Serial on Android
- For local conversation, a LiteRT-LM `.litertlm` or llama.cpp `.gguf` model file
- For Piper Plus speech output, a `.onnx` voice model and matching `.json` config file
- For Style-Bert-VITS2 on iPhone, converted BERT and VITS2 model folders

Compatible firmware:

https://github.com/Corvelis/stackchan-pet-fw

## StreetPass

With compatible firmware, the app can sync Stack-chan StreetPass encounter
history from the device.

Open `Settings > StreetPass` to:

- Sync StreetPass history from Stack-chan
- Edit the StreetPass profile name and message
- View encounter history grouped by peer
- Delete history by peer or by individual message

StreetPass works over the normal WebSocket connection. On Android, it also
works over USB Serial using the existing Stack-chan USB protocol with SCU1 JSON
frames.

Profile text limits are UTF-8 byte limits:

- Name: up to 32 bytes
- Message: up to 80 bytes

For Japanese text, this is roughly 10 characters for the name and 26 characters
for the message.

## Developer Test Devices

The developer mainly tests with:

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## Guides

- [Getting Started](docs/en/getting-started.md)
- [iPhone / TestFlight Beta](docs/en/ios-testflight.md)
- [Android Beta Instructions](docs/en/android-beta.md)
- [Release Notes](docs/en/release-notes.md)
- [Troubleshooting](docs/en/troubleshooting.md)
- [Full User Guide](docs/en/user-manual.md)
- [Memories And Diary](docs/en/diary.md)

## Notes

The main features require a Stack-chan device on the same local network. Without the device, the app cannot proceed to the main conversation screen.

If you configure an external API provider, conversation text, prompts, audio transcription input, and optional image input may be sent to that provider.

Piper Plus voice models have model-specific terms. Tsukuyomi-chan voice models can also be used when prepared by the user, but generated voice has prohibited uses. See [Voice Model Usage Notes](docs/en/voice-model-terms.md).

## Privacy and Licenses

- Original documents in this public repository are published under [Apache-2.0](LICENSE).
- Voice models, LLMs, dictionaries, firmware, and external services are governed by their own provider licenses and terms.
- [Privacy Policy](privacy/en.md)
- [プライバシーポリシー](privacy/ja.md)
- [Third-Party Licenses](THIRD_PARTY_LICENSES_en.md)
- [Model, Dictionary, and Runtime Downloads](docs/en/model-downloads.md)
- [Voice Model Usage Notes](docs/en/voice-model-terms.md)
