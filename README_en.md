# StackChan Pet Talk

[日本語](README.md) | English

StackChan Pet Talk is a beta mobile app for talking with a Stack-chan device running `stackchan-pet-fw`.

## Join the Beta

### iPhone / TestFlight

TestFlight public link:

https://testflight.apple.com/join/Tt1Z4xpT

See [iPhone / TestFlight Beta](docs/en/ios-testflight.md) for the installation steps.

### Android

The Android beta is distributed through Google Play closed testing.

Google Group:

https://groups.google.com/g/stackchan-pet-talk-android-beta

Test opt-in link:

https://play.google.com/apps/testing/app.stackchan.pet.talk

Google Play store page:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

See [Android Beta](docs/en/android-beta.md) for the installation steps.

## Requirements

- A Stack-chan device
- `stackchan-pet-fw`
- An iPhone or Android phone
- A Wi-Fi environment where the phone can reach Stack-chan, or Stack-chan SoftAP
- For local conversation, a LiteRT-LM `.litertlm` model file
- For Piper Plus speech output, a `.onnx` voice model and matching `.json` config file

Compatible firmware:

https://github.com/Corvelis/stackchan-pet-fw

## What to Test

- Connecting to the Stack-chan device
- Moving from setup to the conversation screen after connection
- Text conversation
- Voice conversation through speech recognition
- Speech output from Stack-chan
- Character and conversation settings
- Any connection failures or unexpected behavior

## Developer Test Devices

The developer mainly tests with:

- iOS: iPhone 17 Pro
- Android: Xiaomi 15 Ultra

## Guides

- [Getting Started](docs/en/getting-started.md)
- [iPhone / TestFlight Beta](docs/en/ios-testflight.md)
- [Android Beta Instructions](docs/en/android-beta.md)
- [Troubleshooting](docs/en/troubleshooting.md)
- [Full User Guide](docs/user_manual_en.md)

## Notes

The main features require a Stack-chan device on the same local network. Without the device, the app cannot proceed to the main conversation screen.

If you configure an external API provider, conversation text, prompts, audio transcription input, and optional image input may be sent to that provider.

Piper Plus voice models have model-specific terms. Tsukuyomi-chan voice models can also be used when prepared by the user, but generated voice has prohibited uses. See [Voice Model Usage Notes](docs/en/voice-model-terms.md).

## Privacy and Licenses

- [Privacy Policy](privacy/en.md)
- [プライバシーポリシー](privacy/ja.md)
- [Third-Party Licenses](THIRD_PARTY_LICENSES_en.md)
- [Model, Dictionary, and Runtime Downloads](MODEL_DOWNLOADS.md)
- [Voice Model Usage Notes](docs/en/voice-model-terms.md)
