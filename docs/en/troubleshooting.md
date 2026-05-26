# Troubleshooting

[Back to README](../../README_en.md) | [日本語](../ja/troubleshooting.md)

## Stack-chan Cannot Be Found

- Make sure the phone and Stack-chan are on the same Wi-Fi network.
- For SoftAP, make sure the phone is connected to Stack-chan Wi-Fi.
- Check Host and Port. The usual SoftAP default is `192.168.4.1:8080`.
- On iPhone, make sure Local Network permission is allowed.
- Check whether VPN, Private Relay, or mobile-data-priority settings are blocking local network access.

## Connected, but Conversation Does Not Work

- Check the LLM settings.
- For external APIs, check API key, Base URL, and model name.
- For local LLM, make sure a model file is selected.
- Make sure the Stack-chan-side WebSocket server is running.

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

## Camera or Image Features Do Not Work

- Make sure Stack-chan-side `POST /capture` is available.
- If the camera is still starting, wait and try again.
- For features that need camera or photo permissions, check app permissions.

## Useful Feedback Details

- Device and OS version
- App version
- Connection mode: SoftAP / Wi-Fi IP
- Host / Port
- What you were doing
- Error message
- Screenshot, if available
