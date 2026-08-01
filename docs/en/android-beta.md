# Android Beta

[Back to README](../../README_en.md) | [日本語](../ja/android-beta.md)

The Android beta is distributed through Google Play open testing. A Google
account is required, but no Google Group membership or individual approval is
needed.

## 1. Join the Google Play Open Test

Open the Google Play test opt-in link on your Android phone.

Google Play test opt-in link:

https://play.google.com/apps/testing/app.stackchan.pet.talk

Tap `Become a tester`, then install `StackChan Pet Talk` from Google Play.

Google Play store page:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

The test opt-in link joins the open test. In some regions you may be able to
join directly from the store page. If the store page is unavailable, open the
test opt-in link first.

Country availability and Play access may take some time to propagate. If
Google Play says the item is not available, confirm the Google account and
country in use, wait a while, and open the link again.

## 2. Complete Initial Setup

After installation, follow [Getting Started](getting-started.md) to connect to Stack-chan, configure local LLM, configure Piper Plus TTS, and start a conversation.

## Requirements

The Android version requires:

- A Stack-chan device
- `stackchan-pet-fw`
- An Android phone
- Wi-Fi where the Android phone can reach Stack-chan, Stack-chan SoftAP, or USB Serial
- For local conversation, a LiteRT-LM `.litertlm` or llama.cpp `.gguf` model file
- For Piper Plus speech output, a `.onnx` voice model and matching `.json` config file

Compatible firmware:

https://github.com/Corvelis/stackchan-pet-fw

## What to Test

- Installation and startup
- SoftAP, Wi-Fi IP, and USB Serial connections to Stack-chan
- Text and voice conversations
- StopWatch remote capture with the phone camera
- Local LLM and VLM conversations
- llama.cpp OpenCL GPU execution on compatible Qualcomm Adreno devices
- VLM image preprocessing and streaming chat updates
- Crashes, heat, and performance differences across Android devices

## Permissions and Notes

The app may request permissions depending on which features you use.

- Network access: required to connect to Stack-chan or external APIs
- Microphone: used for voice input
- Camera/photos/files: used for optional image features or model file selection
- USB: used when connecting to Stack-chan over USB Serial
- Notifications: used when Android background conversation is enabled

Android battery management varies by manufacturer. If background conversation stops unexpectedly, check battery optimization and background restriction settings on the device.

## Google Play Testing Notes

When the Android version is distributed through a Google Play testing track, the distributor may be able to view information needed to manage the beta and investigate issues in Google Play Console. This may include tester lists, participation status, aggregated device and Android version information, crashes, and ANRs.

The distributor uses this information only for beta operation, issue investigation, and app improvement. It is not used for unrelated purposes.

Google Play open testing may not be available immediately depending on test
opt-in status, review, country/region settings, device compatibility, and
propagation time.
