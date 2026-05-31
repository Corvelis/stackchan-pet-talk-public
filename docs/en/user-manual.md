# StackChan Pet Talk User Guide

Last updated: 2026-05-31

This guide is for first-time users of `StackChan Pet Talk`. It assumes a
limited beta build distributed through TestFlight or Google Play closed testing.

## 0. What To Prepare First

Required:

- Stack-chan hardware
- A Wi-Fi environment that connects Stack-chan and the phone, or Stack-chan SoftAP
- Stack-chan-side WebSocket server
- An LLM for conversation: OpenAI, Gemini, OpenAI compatible API, or a local LLM

Compatible Stack-chan-side firmware is available from the Releases page:

https://github.com/Corvelis/stackchan-pet-fw/releases

Required for voice and image features:

- Binary WebSocket microphone audio from Stack-chan. The app expects PCM16 with
  an `SCM1` or `MIC1` header.
- Binary WebSocket speaker playback on Stack-chan. The app sends 16 kHz mono
  PCM16.
- Stack-chan camera HTTP `POST /capture` for visual questions, face enrollment,
  face checks, and camera button reactions.
- JSON events such as `interaction.event` or `camera_button` from Stack-chan
  when using petting, touch, or camera button reactions.

If you use local models or dictionaries, read [Model, Dictionary, and Runtime Downloads](model-downloads.md)
first. It lists Piper Plus voice models, OpenJTalk dictionaries, llama.cpp
GGUF files, LiteRT-LM `.litertlm` files, bundled model/runtime sources, and
license checks.

For the shortest beta setup flow, start with
[Getting Started](getting-started.md).

## 1. What This App Does

`StackChan Pet Talk` lets you connect to Stack-chan from a phone and have a
conversation.

Main features:

- SoftAP / Wi-Fi IP connection to Stack-chan
- Text conversation
- Voice input through the Stack-chan microphone
- Voice output through the Stack-chan speaker
- ASR, TTS, and LLM settings
- Master recognition by face and voice
- Character settings based on affection, mood, and confusion
- Android background conversation
- Japanese / English UI switching
- In-app license display
- Stack-chan camera/capture button reactions
- Connection greeting voice lines when TTS is available
- Petting/touch reactions
- Stack-chan StreetPass history sync and profile editing

## 2. Installation

### iPhone

1. Open TestFlight from the invitation email or shared link.
2. Install `StackChan Pet Talk`.
3. If the app asks for permissions on first launch, review the purpose and
   allow the permissions you need.

### Android

1. Join the Android beta Google Group.
2. Open the Google Play closed testing opt-in link.
3. Tap `Become a tester`.
4. Install `StackChan Pet Talk` from Google Play.
5. Android may ask for notification permission or battery optimization changes.
   Allow them if you want to use background conversation.

## 3. First Connection

After launch, choose how to connect to Stack-chan.

### SoftAP

1. Put Stack-chan into SoftAP mode.
2. Connect your phone to the Stack-chan Wi-Fi network.
3. Select `SoftAP` in the app.
4. Host is usually `192.168.4.1`; Port is usually `8080`.
5. Tap `Connect`.

### Wi-Fi IP

1. Connect Stack-chan and your phone to the same Wi-Fi network.
2. Select `Wi-Fi IP` in the app.
3. Enter the Stack-chan IP address in Host.
4. Enter the Port. The usual value is `8080`.
5. Tap `Connect`.

When the connection succeeds, the app opens the conversation screen. If it
fails, check Host, Port, your phone Wi-Fi, and the Stack-chan WebSocket setup.

If TTS is enabled, the app plays one connection greeting voice line only when
you connect from the first connection screen. It does not play this greeting for
automatic reconnects or reconnects from the conversation screen.

If `Camera master check` and `Face master recognition` are enabled and a face
profile is registered, the app runs Stack-chan camera master recognition before
choosing the greeting voice. If the master is confirmed, the app chooses from
the affection-level connection greeting voices. If the master is not confirmed,
it falls back to the standard greeting.

## 4. Conversation Screen

The conversation screen shows Stack-chan status and conversation history.

Top area:

- Connection status
- Endpoint
- Voice detection state
- Background conversation state

Middle area:

- Stack-chan state
- Master recognition state
- Affection
- Mood
- Confusion
- Conversation history
- Error and event logs

Bottom area:

- Text input
- Send button
- Microphone button

To talk by text, type a message and send it. To talk by voice, configure LLM
and TTS first, return to the conversation screen, and tap the microphone button
at the bottom of the screen. When speech input starts, speak to Stack-chan, then
check the speech recognition result, the LLM reply, and the reply audio from
Stack-chan.

To clear the conversation history, tap the delete button next to the history
heading.

Use the link icon in the top-right area to connect or disconnect. The phone icon
controls Android background conversation. The tuning icon opens Settings.

Use the `JA` / `EN` button in the app bar to switch the UI language.

### Asking About Images

When `Camera master check` is enabled in master recognition settings, questions
that require an image can trigger Stack-chan camera capture. For example,
questions such as "Can you see this?" or "Look at what is in front of you" can
start capture and recognition.

When `VLM fallback response` is enabled, the same image is sent to the VLM when
the master face does not match or no face is found.

### Stack-chan Button And Touch Reactions

When the app receives a camera/capture button event from Stack-chan, it starts a
short visual-description conversation using the captured image.

When the app receives a petting event, it reacts with a voice line for the
current affection level.

## 5. Connection Settings

Open `Settings > Stack-chan connection` to change the connection target.

Settings:

- `SoftAP` / `Wi-Fi IP`
- `USB Serial` on Android
- Host
- Port
- Connect
- Disconnect

After changing the connection mode or IP address, tap `Connect` again.

USB Serial is available only on Android. In USB Serial mode, the Port field
shows the baud rate, usually `921600`. This is handled separately from the
Wi-Fi IP port.

## 6. StreetPass

Open `Settings > StreetPass` to sync StreetPass encounter history stored on the
Stack-chan device.

Basic flow:

1. Connect to Stack-chan from `Settings > Stack-chan connection`.
2. Open `Settings > StreetPass`.
3. Tap `Sync now`.
4. After sync, edit the StreetPass profile name and message.
5. Encounter history is grouped by peer. Tap a peer to view messages received
   from that peer.

During sync, the app sends the current phone time to Stack-chan. Encounter
times are displayed in the phone's local timezone. If the device recorded an
encounter with unknown time quality, the app shows `Time unknown`.

Editable profile fields:

- Name
- Message

The app does not expose StreetPass enable/disable or profile sharing settings.

Profile text limits are UTF-8 byte limits, not character counts.

| Field | Limit |
| --- | --- |
| Name | 32 bytes |
| Message | 80 bytes |

For Japanese text, this is roughly 10 characters for the name and 26 characters
for the message. The input fields show byte counts, and saving is disabled when
the limit is exceeded.

History behavior:

- History is grouped by peer.
- If two peers have the same display name but different firmware-side peer
  identifiers, they are treated as different peers.
- Repeated identical messages from the same peer are shown once in the message
  history.
- You can delete history by peer or delete an individual message history item.
- History deleted in the app is not automatically restored by normal
  incremental sync.

Stack-chan has a limited number of records on the device. Sync periodically if
you want to keep history in the app.

## 7. Voice AI Settings

Open `Settings > Voice AI` to configure ASR and TTS.

### ASR

Choose a speech recognition engine:

- ReazonSpeech (phone local)
- gpt-4o-transcribe (cloud API)
- gpt-4o-mini-transcribe (cloud API)
- whisper.cpp server (local PC API)
- gpt-realtime-whisper (deprecated)

OpenAI API based ASR requires an API key. Realtime Whisper is treated as
deprecated. For normal use, choose `gpt-4o-transcribe` or
`gpt-4o-mini-transcribe`.

#### whisper.cpp server

To use a whisper.cpp server running on a PC or another machine, choose
`whisper.cpp server (local PC API)` as the speech recognition engine.

Settings:

- `whisper.cpp URL`: Enter the whisper.cpp server URL. The default is `http://localhost:8090`.

The app converts each detected speech segment to WAV and sends it to the
whisper.cpp server `/inference` API as multipart form-data. If the URL has no
path, the app appends `/inference` automatically. For example,
`http://192.168.0.10:8090` sends requests to
`http://192.168.0.10:8090/inference`.

`VAD silence` controls how much silence is required before speech is considered
finished.

### TTS

Choose a text-to-speech engine:

- Disabled
- Piper Plus
- OpenAI TTS
- Irodori TTS server

For Piper Plus, select a model file `.onnx` and a config file `.json`. You can
adjust Japanese length, English length, noise scale, and noise W. Tap
`Warm up: こんにちは` to test playback.

When testing from a phone only, start with this file pair:

- `.onnx`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/css10-ja-6lang-fp16.onnx
- `.json`: https://huggingface.co/ayousanz/piper-plus-css10-ja-6lang/resolve/main/config.json

On iPhone Safari, tapping `config.json` may display the JSON text instead of
downloading it. Open the file through Hugging Face `raw`, then long-press the
displayed JSON page and choose `Download Linked File`.

Tsukuyomi-chan character voices can also be used. If you use a Tsukuyomi-chan
voice model, review [Voice Model Usage Notes](voice-model-terms.md), the model
card, and provider terms first.
For the Piper Plus download command, OpenJTalk dictionary URL, and file
placement, see [Model, Dictionary, and Runtime Downloads](model-downloads.md).

#### OpenAI TTS

To use OpenAI TTS, choose `OpenAI TTS` as the TTS engine.

Settings:

- `OpenAI TTS API key`: Enter your OpenAI TTS API key. Use the eye icon to show or hide it.
- `TTS base URL`: Usually keep `https://api.openai.com/v1`.
- `TTS model`: Choose a model such as `gpt-4o-mini-tts`.
- `TTS voice`: Choose from the voices supported by the selected model.
- `Speech instructions`: Optional instructions for supported models.
- `Audio format`: Usually keep `PCM16`.
- `Speech speed`: Adjust playback speed.
- `Speech gap`: Gap between punctuation-based audio segments. The default is `50ms`.

OpenAI TTS and Irodori TTS split LLM replies around punctuation, synthesize the
next segment while the current one is playing, and preserve playback order. The
app lightly trims leading and trailing silence from returned audio. Increase
`Speech gap` if replies feel too fast, or decrease it if the pause feels too
long.

#### Irodori TTS Server

To use Irodori TTS, start an Irodori TTS server on your PC or another machine,
then choose `Irodori TTS server` as the TTS engine.

Settings:

- `TTS base URL`: OpenAI-compatible API URL for the Irodori TTS server, for example `http://192.168.0.10:8088/v1`.
- `API key (optional)`: Leave empty if your server does not require authentication.
- `TTS model`: Usually keep `irodori-tts`.
- `TTS voice`: Enter `none` or a registered voice name.
- `Load voices from server`: Fetch registered voices from the server and show them as choices. If there are no voices, use `none`.
- `Upload voice name`: Voice name used when uploading a reference audio file. If empty, the audio file name is used.
- `Upload reference voice`: Upload a reference audio file from the client to the server. If the same name already exists, it is replaced.
- `Audio format`: Usually keep `WAV`. If you choose `PCM16`, also configure the PCM sample rate.
- `Speech speed`: Adjust playback speed.
- `Irodori num_steps`: Generation step count for Irodori TTS. The default is `20`. Lower values may be faster; higher values may improve quality.
- `Speech gap`: Gap between punctuation-based audio segments. The default is `50ms`.

When `TTS voice` is `none`, the reference voice is not fixed and the voice may
change between requests. To keep the voice consistent, upload a reference voice
and select that voice name.

Immediately before TTS synthesis, the app applies lightweight vocabulary rules
for attacks, political/religious/ideological calls to action, and intense
expressions. When text matches these rules, the conversation text remains
visible, but audio synthesis is skipped.

## 8. LLM Settings

Open `Settings > LLM` to configure the LLM used for conversation.

Providers:

- OpenAI compatible API
- OpenAI API
- Gemini API
- llama.cpp
- LiteRT-LM

API providers use settings such as Base URL, model name, and API key. Local LLM
providers use a model file and generation settings such as max tokens,
temperature, topK, topP, context size, batch size, and thread count.

Set Base URL to the PC LAN IP, for example `http://192.168.0.10:8080/v1`.

`Conversation history for LLM` controls how many past turns are sent to the LLM.
Thinking control is available for compatible models.

For llama.cpp, select a GGUF model file. If you use a vision-capable model,
select an mmproj file as well. For LiteRT-LM, the current app implementation
selects a `.litertlm` model file. `.task` files are not selectable in this
screen. When testing a local LLM from a smartphone, start with Gemma 4 E2B
`gemma-4-E2B-it.litertlm`.

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- Direct download: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

For local LLMs, you can choose CPU or GPU. Android x llama.cpp is CPU only.
When llama.cpp uses GPU, adjust the GPU layer count. Lower it if Metal crashes.

llama.cpp and LiteRT-LM provide warmup buttons. Use them to confirm that the
model loads correctly. LiteRT-LM also has `VLM image warmup`, which verifies
initialization with image input.

## 9. Master Recognition

Open `Settings > Master recognition` to configure face and voice recognition.

Important:

- Master recognition is for character interaction.
- The design stores recognition embeddings, not raw face images or raw voice
  recordings.

Settings:

- Camera master check
- VLM fallback response
- Face master recognition
- Voice master recognition
- Face threshold
- Voice threshold
- Register, recognition check, and delete registration
- Master found reactions
- Prompt when master is not recognized

For face enrollment, make sure only the master is visible to the Stack-chan
camera. For voice enrollment, speak naturally for a few seconds to register
samples.

Face enrollment stores up to 3 samples. It stores recognition embeddings, not
the raw face images. Voice enrollment can be saved after at least 3 samples. It
stores an averaged embedding, not raw recordings.

`Master found reactions` lets you edit voice lines for each affection level
when Stack-chan finds the master. `{masterName}` is replaced with the master
name from character settings.

## 10. Character Settings

Open `Settings > Character settings` to adjust Stack-chan's personality and
reactions.

Tabs:

- Basic
- Affection
- Voice reactions

Basic tab:

- Master name
- Base prompt
- Prompt for mood 70+
- Prompt for confusion 60+

Affection tab:

- Affection prompt on/off
- System prompt for each affection level

Voice reactions tab:

- Voice line when petted for each affection level
- Voice line when connected for each affection level
- Add and delete reaction voice lines

Tap `Save` after editing. Tap `Reset defaults` to reset the current tab.

The petting voice lines are used when Stack-chan sends petting or touch events.
Connection greeting voice lines are used for the greeting played after
connecting from the first connection screen. When camera master check is
enabled, the app applies the recognition result before choosing from the
affection-level candidates.
Master-found voice lines are edited from
`Settings > Master recognition > Master found reactions`.

## 11. Background Conversation

On Android, use the phone icon at the top of the conversation screen to enable
background conversation.

Android may ask for notification permission or battery optimization changes.
For stable background conversation, allow notification permission and exclude
the app from battery optimization if needed.

To stop background conversation, tap the same button again or stop it from the
notification.

## 12. Debug

Open `Settings > Debug` to temporarily change affection for the current
session.

This is for behavior checks. Normal users do not need to change it.

## 13. Licenses

Open `Settings > Licenses` to view bundled license and NOTICE information.

## 14. Privacy

If you configure external APIs such as OpenAI API, an OpenAI compatible API, or
Gemini API, texts, recognition results, images, or parts of conversation history
may be sent to those external services.

See:

- [PRIVACY_en.md](../../PRIVACY_en.md)
- [THIRD_PARTY_LICENSES_en.md](../../THIRD_PARTY_LICENSES_en.md)

## 15. Troubleshooting

Cannot connect:

- Check that your phone and Stack-chan are on the same network.
- For SoftAP, check that your phone is connected to the Stack-chan Wi-Fi.
- Check Host and Port.
- Check that the Stack-chan WebSocket server is running.

Voice input does not work:

- Check that the microphone button is enabled.
- Check that the Stack-chan microphone is available.
- Check ASR settings and API keys.
- If you use ReazonSpeech, ask the distributor whether the beta build includes
  the ReazonSpeech and Silero VAD models.

No voice output:

- Check that TTS is not disabled.
- Check the Piper Plus model file and config file.
- If you use a Japanese OpenJTalk-based Piper Plus model, check that the
  OpenJTalk dictionary is bundled or installed.
- Check the Stack-chan speaker connection.

LLM does not respond:

- Check the LLM provider, model name, API key, and Base URL.
- For local LLM, check the model file path.
- If a real phone uses an OpenAI compatible API server on your PC, check that
  Base URL uses the PC LAN IP instead of `localhost`.
- For LiteRT-LM, check that you selected a `.litertlm` file.
- Check the error display on the conversation screen.
