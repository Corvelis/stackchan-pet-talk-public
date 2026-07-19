# Troubleshooting

[Back to README](../../README_en.md) | [日本語](../ja/troubleshooting.md)

## Stack-chan Cannot Be Found

- Make sure the phone and Stack-chan are on the same Wi-Fi network.
- For SoftAP, make sure the phone is connected to Stack-chan Wi-Fi.
- Check Host and Port. The usual SoftAP default is `192.168.4.1:8080`.
- On iPhone, make sure Local Network permission is allowed.
- Check whether VPN, Private Relay, or mobile-data-priority settings are blocking local network access.
- For USB Serial on Android, check the USB cable, the baud rate in the Port field, and USB device permission.

## Connected, but Conversation Does Not Work

- Check the LLM settings.
- For external APIs, check API key, Base URL, and model name.
- For local LLM, make sure a model file is selected.
- Make sure the Stack-chan-side WebSocket server is running.

## Local LLM Does Not Load

- For LiteRT-LM, select a `.litertlm` file. For llama.cpp, select a `.gguf` file.
- For image input, use an `mmproj*.gguf` from the same model family and revision as the main GGUF.
- For Flash MoE on iPhone, make sure the selected folder contains `.layer00.pack` through `.layer23.pack` from the same model.
- Wait for import to finish after selecting a model. If the issue continues, use `Clear imported LLM files`, then select the files again.

## Speech Recognition Does Not Work

- Make sure an ASR engine is selected in voice settings.
- Make sure microphone audio is being sent from Stack-chan.
- For external ASR APIs, check the API key and network connection.
- For a PC server, use the PC's LAN IP address. `localhost` points to the phone itself.

## No Speech Output

- Make sure TTS is enabled in voice settings.
- Make sure Stack-chan-side speaker playback is enabled.
- Check volume, mute state, and connection state.
- Check the TTS model or external API settings.
- For Style-Bert-VITS2, make sure both converted BERT and VITS2 folders are selected on iPhone and a voice is selected.

## Camera or Image Features Do Not Work

- Make sure Stack-chan-side `POST /capture` is available.
- If the camera is still starting, wait and try again.
- For features that need camera or photo permissions, check app permissions.
- When attaching a phone image, make sure an image-capable LLM is configured and, for llama.cpp, a matching `mmproj` is selected.
- The selected image is attached to the next message. Enter a question and send it after choosing the image.
- If `Device camera` is not shown, the connected device either did not report camera support or its camera is unavailable.

## Steps, Shake Reactions, or Speech Bubbles Do Not Work

- These features depend on compatible firmware and capabilities reported by the device.
- For step greetings, check that the feature is enabled in `Character settings` and that the threshold or step-range change has been reached.
- Shake reactions run when the app receives a compatible `shake` or `start` event.
- Speech bubbles appear only when the device supports `display.speech_bubble.v1`.
- After switching between `Shared` and `Per device` character mode, make sure you are editing the character for the current connection target.

## Useful Feedback Details

- Device and OS version
- App version
- Connection mode: SoftAP / Wi-Fi IP / USB Serial
- Host / Port
- What you were doing
- Error message
- Screenshot, if available
