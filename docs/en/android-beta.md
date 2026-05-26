# Android Beta

[Back to README](../../README_en.md) | [日本語](../ja/android-beta.md)

The Android beta is distributed through Google Play closed testing.

At this stage, distribution is limited to testers who join the Android beta Google Group.

## 1. Join the Google Group

Join the Android beta Google Group first.

```text
stackchan-pet-talk-android-beta@googlegroups.com
```

Google Group join link:

https://groups.google.com/g/stackchan-pet-talk-android-beta

Until your group membership is active, the Google Play test link may not allow installation.

## 2. Join the Google Play Test

After joining the Google Group, open the Google Play test opt-in link on your Android phone.

Google Play test opt-in link:

https://play.google.com/apps/testing/app.stackchan.pet.talk

Tap `Become a tester`, then install `StackChan Pet Talk` from Google Play.

Google Play store page:

https://play.google.com/store/apps/details?id=app.stackchan.pet.talk

The test opt-in link is used to join the closed test. The store page is used to install the app after joining the test. If the Google account has not joined the Google Group, group membership has not propagated yet, or `Become a tester` has not been tapped, the store page may not be available.

It may take some time for group membership and Play access to take effect. If Google Play says the item is not available, wait a while and open the link again.

## 3. Complete Initial Setup

After installation, follow [Getting Started](getting-started.md) to connect to Stack-chan, configure local LLM, configure Piper Plus TTS, and start a conversation.

## Requirements

The Android version requires:

- A Stack-chan device
- `stackchan-pet-fw`
- An Android phone
- A Wi-Fi environment where the Android phone can reach Stack-chan, or Stack-chan SoftAP
- For local conversation, a LiteRT-LM `.litertlm` model file
- For Piper Plus speech output, a `.onnx` voice model and matching `.json` config file

Compatible firmware:

https://github.com/Corvelis/stackchan-pet-fw

## What to Test on Android

- App installation and launch
- SoftAP / Wi-Fi IP connection to Stack-chan
- Text conversation
- Voice input through the microphone button
- Piper Plus speech output
- Local LLM conversation with LiteRT-LM / Gemma 4 E2B
- Model file picker behavior
- Crashes, heat, and performance differences across Android devices

The developer mainly tests on Xiaomi 15 Ultra. Feedback from other Android devices is especially useful.

## Permissions and Notes

The app may request permissions depending on which features you use.

- Network access: required to connect to Stack-chan or external APIs
- Microphone: used for voice input
- Camera/photos/files: used for optional image features or model file selection
- Notifications: used when Android background conversation is enabled

Android battery management varies by manufacturer. If background conversation stops unexpectedly, check battery optimization and background restriction settings on the device.

## Feedback

Please report bugs or unexpected behavior through the contact method shared by the distributor.

Useful details:

- Android device model
- Android version
- Connection mode: SoftAP / Wi-Fi IP
- What you were doing
- Error messages or screenshots
- LLM/TTS model file names used

## Google Play Testing Notes

When the Android version is distributed through a Google Play testing track, the distributor may be able to view information needed to manage the beta and investigate issues in Google Play Console. This may include tester lists, participation status, aggregated device and Android version information, crashes, and ANRs.

The distributor uses this information only for beta operation, issue investigation, and app improvement. It is not used for unrelated purposes.

Google Play closed testing may not be available immediately depending on Google Group membership, test opt-in status, review, country/region settings, and propagation time.
