# StackChan Pet Talk User Guide

Last updated: 2026-08-01

This guide is for first-time users of `StackChan Pet Talk`. It assumes a beta
build distributed through TestFlight or Google Play open testing.

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
  when using petting, touch, shake, or camera button reactions.
- Compatible firmware that reports device information and capabilities when
  using per-device characters, step count integration, or TTS speech bubbles.

If you use local models or dictionaries, read [Model, Dictionary, and Runtime Downloads](model-downloads.md)
first. It lists Piper Plus voice models, Style-Bert-VITS2 for iPhone,
OpenJTalk dictionaries, llama.cpp
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
- Shake reactions and step-based connection voice lines
- Image attachments from the phone camera, photo library, or Stack-chan camera
- Shared or per-device character settings
- Stack-chan StreetPass history sync and profile editing
- Memory logs and diary generation. See [Memories And Diary](diary.md) for details.

## 2. Installation

### iPhone

1. Open TestFlight from the invitation email or shared link.
2. Install `StackChan Pet Talk`.
3. If the app asks for permissions on first launch, review the purpose and
   allow the permissions you need.

### Android

1. Open the Google Play open-testing opt-in link.
2. Tap `Become a tester`.
3. Install `StackChan Pet Talk` from Google Play.
4. Android may ask for notification permission or battery optimization changes.
   Allow them if you want to use background conversation.

## 3. First Connection

After launch, choose how to connect to Stack-chan.

Under `Character mode`, choose `Shared` to use one character with every
Stack-chan, or `Per device` to keep character settings, affection, and memories
separate for each connected device.

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

### USB Serial (Android Only)

1. Connect a compatible Stack-chan to the Android phone with a USB cable.
2. Select `USB Serial` in the app.
3. Check the baud rate in the Port field. The usual value is `921600`.
4. Tap `Connect` and allow USB device access if Android asks.

When the connection succeeds, the app opens the conversation screen. If it
fails, check Host, Port, Wi-Fi, USB cable and permission, or Stack-chan-side
communication settings as appropriate for the selected connection mode.

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
- Errors, event logs, and the active LLM model name

Bottom area:

- Text input
- Send button
- Microphone button
- Image attachment button

To talk by text, type a message and send it. To talk by voice, configure LLM
and TTS first, return to the conversation screen, and tap the microphone button
at the bottom of the screen. When speech input starts, speak to Stack-chan, then
check the speech recognition result, the LLM reply, and the reply audio from
Stack-chan.

Tap the arrow button next to the conversation history heading to collapse the
connection status, Stack-chan state, affection, mood, confusion, event logs,
and other status information, giving the conversation history more space.
The status area also shows the active LLM model. Cloud providers such as Gemini
and OpenAI use a name such as `Gemini 3.6 Flash`, while local LLMs show the model
file name.

To clear the conversation history, tap the delete button next to the history
heading.

Use the link icon in the top-right area to connect or disconnect. The phone icon
controls Android background conversation. The tuning icon opens Settings.

Use the `JA` / `EN` button in the app bar to switch the UI language.

### Asking About Images

Tap the image attachment button beside the input field to choose an image source:

- `Phone camera`: Take a new photo.
- `Photo library`: Choose an image stored on the phone.
- `Device camera`: Capture an image with the connected Stack-chan when its
  camera is available.

The selected image is marked `Ready for the next message` and is attached to
the next text you send. Answering questions about it requires an image-capable
LLM and, for llama.cpp, a matching mmproj.
For llama.cpp, adjust the image size under
`Settings > LLM > VLM input image max edge`.

In addition, when `Camera master check` is enabled in master recognition
settings, questions that require an image can automatically trigger Stack-chan
camera capture. For example, questions such as "Can you see this?" or "Look at
what is in front of you" can start capture and recognition.

When `VLM fallback response` is enabled, the same image is sent to the VLM when
the master face does not match or no face is found.

### Remotely Taking A Phone Photo From StopWatch

After connecting to a StopWatch with compatible firmware, use the conversation
screen's image button and choose `StopWatch remote camera`. On first use, allow
the OS camera and photo-library prompts. Use the switch button in the upper-right
to select the front or back camera; the app saves that preference.

After closing the setup screen, a blue camera control appears in the upper-right
of the StopWatch. Tap it to open the saved camera on the phone automatically,
start a one-second countdown, take a photo, and save it to the photo library.
The captured photo is also attached automatically to the next text or voice
message. You can review or remove it from the composer preview before sending.
Mobile OS restrictions allow the camera screen to open automatically only while
the phone app is in the foreground.

With compatible firmware, the StopWatch camera control shows `IN` or `OUT` for
the saved lens. Hold the control for about 0.8 seconds to switch between the
front and back cameras and save the selection on the phone. A short tap still
takes a photo.

### Stack-chan Button And Touch Reactions

When the app receives a camera/capture button event from Stack-chan, it starts a
short visual-description conversation using the captured image.

When the app receives a petting, touch, `pat`, or `pet` event, it reacts with a
voice line for the current affection level. A `shake` or `start` event uses one
of the character's `Voice line when shaken` entries.

## 5. Connection Settings

Open `Settings > Stack-chan connection` to change the connection target.

Settings:

- `SoftAP` / `Wi-Fi IP`
- `USB Serial` on Android
- Host
- Port
- Character mode (`Shared` / `Per device`)
- Connect
- Disconnect

After changing the connection mode or IP address, tap `Connect` again.

USB Serial is available only on Android. In USB Serial mode, the Port field
shows the baud rate, usually `921600`. This is handled separately from the
Wi-Fi IP port.

In `Per device` mode, the app uses the device ID reported by compatible firmware
to switch character settings and memories. If settings or diaries appear to be
missing after connecting to another Stack-chan, check this mode.

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

### Keyword Activation

Keyword activation lets the app wait for a registered wake phrase after you tap
the microphone button. The wake phrase is not fixed. You record your own phrase
and use that recording as the keyword.

Open `Settings > Voice AI > Keyword Activation` to configure it.

#### How to use it

1. Turn on `Keyword activation`.
2. Open `Register wake phrase` and record the phrase you want to use several
   times, for example `Hey, Stack-chan` or `Start conversation`.
3. Use `Test keyword detection` to check whether the app detects the registered
   phrase.
4. Tap the microphone button on the conversation screen.
5. Say the wake phrase. A short sound plays, then the app enters normal
   conversation mode.

After the conversation starts, you do not need to say the wake phrase for every
turn. You can keep talking normally.

#### End phrases

End phrases are checked from the ASR text after speech recognition.

The default list includes phrases such as `またね、スタックチャン`, `会話終了`,
and `対話終了`. You can add, remove, or replace them. Multiple end phrases can
be registered.

When you say an end phrase during a conversation, an end sound plays and the
conversation ends. After that, the app waits for the wake phrase again before
starting another conversation.

#### Tuning

- `Detection threshold`: Lower values reduce false detections but may miss the wake phrase. Higher values make detection easier but may react to similar speech.
- `Wake Word VAD silence`: Silence duration used to split wake phrase candidates. Shorter values respond faster. Longer values make it easier to capture the whole phrase.
- `VAD silence`: Silence duration used for normal ASR speech segmentation. This can be tuned separately from Wake Word VAD silence.

Both Wake Word VAD silence and ASR VAD silence can be adjusted from 50ms to
1000ms in 10ms steps. A shorter Wake Word value usually feels faster. A slightly
longer ASR value can help avoid cutting off normal speech too early.

#### Recording tips

- Record from a distance, volume, and speaking style similar to normal use.
- Very short phrases or words that often appear in normal conversation are more likely to cause false detections.
- If detection is difficult, record the same wake phrase again or raise the threshold a little.
- If false detections happen often, lower the threshold a little or use a longer, more distinctive wake phrase.

### TTS

Choose a text-to-speech engine:

- Disabled
- Piper Plus
- Style-Bert-VITS2 (iPhone CoreML, iOS only)
- OpenAI TTS
- Irodori TTS server

Enable `Skip parenthesized text` to keep half-width `(...)`, full-width
`（...）`, and their contents out of TTS. The reply shown on the conversation
screen is unchanged; only the spoken text is filtered. This applies to both
normal and streaming replies.

For Piper Plus, select a model file `.onnx` and a config file `.json`. You can
adjust Japanese length, English length, noise scale, and noise W. Enable
`Robot-style voice` to process the output with adjustable speed (0.5x to 4.0x),
base F0 (50 to 500 Hz), and intonation (0 to 1).

Enter a phrase under `Warmup text`, then tap `Warm up TTS` to test the current
TTS settings.

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

The selected model and config are imported into app-managed storage. The
imported copies remain usable if the original files are moved or deleted.

#### Style-Bert-VITS2 (iPhone CoreML)

On iPhone, the app can run a Style-Bert-VITS2 model that has already been
converted to the supported split ONNX / Core ML format.

Settings:

- `BERT folder`: A folder containing the converted BERT model files.
- `VITS2 folder`: A folder containing one or more converted voices.
- `Voice`: A voice detected in the VITS2 folder.
- `Speaker ID`: The speaker ID to use.
- `Style`: A style included by the model, such as `Neutral`.
- `Speech speed`: Adjustable from 0.5x to 2.0x.

Select the BERT and VITS2 folders separately. They are copied into the app when
first selected. Ordinary unconverted models cannot be selected directly. Use a
compatible model prepared by the distributor, and review its model-specific
license and usage terms.

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

Streaming replies treat `。`, `！`, `？`, `!`, and `?` as speech boundaries.
Piper Plus and Style-Bert-VITS2 insert a 100ms gap between these audio
segments. OpenAI TTS and Irodori TTS use the configured `Speech gap` and
synthesize the next segment while the current one is playing. Playback order
is preserved, and the app lightly trims leading and trailing silence from
returned audio. Increase `Speech gap` if replies feel too fast, or decrease it
if the pause feels too long.

When compatible firmware reports `display.speech_bubble.v1`, the app sends each
segmented utterance to Stack-chan and synchronizes the speech bubble with audio
start, completion, and cancellation.

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

For OpenAI API, you can select GPT-5.6 Sol, GPT-5.6 Terra, GPT-5.6 Luna,
GPT-5.5, GPT-5.4, GPT-5.4 mini, and GPT-5.4 nano. Choose `Other` to enter a
model ID that is not in the list.

For Gemini API, you can select Gemini 3.6 Flash, Gemini 3.5 Flash, Gemini 3.5
Flash-Lite, Gemini 3.1 Flash-Lite, and Gemini 3 Flash Preview. Compatible
models let you choose the thinking level from minimal, low, medium, or high.

Set Base URL to the PC LAN IP, for example `http://192.168.0.10:8080/v1`.

`Conversation history for LLM` controls how many past turns are sent to the LLM.
Thinking control is available for compatible models.

For local LLMs, `Prefix KV cache` can preload part of the previous conversation
history and system prompt so the next reply can start faster. You can turn it on
or off in `Settings > LLM` under the local LLM settings. It applies to llama.cpp
and LiteRT-LM. Enabling it may improve response start time, but the app performs
extra preloading after conversation turns, so CPU / GPU / memory usage, heat, and
battery consumption may increase. Turn it off if generation becomes unstable or
the device gets too warm. Image-based conversations may fall back to normal
generation without using this cache. When this setting is enabled, the amount of
conversation history used by the local LLM is adjusted automatically for the
selected local backend.

For llama.cpp, select a GGUF model file. If you use a vision-capable model,
select an mmproj file as well. Enable `Preprocess VLM images (KV cache)` to run
the vision encoder and image-token prefill as soon as an image is selected. If
the system prompt, history, image, and related settings still match at send
time, the app restores the saved KV cache and resumes from the typed text.
Mismatches and restore failures automatically use the normal image path. This
option is enabled only when llama.cpp is using the GPU and is disabled on CPU.

`VLM input image max edge` offers `Original
size`, `128px`, `256px`, `384px`, `512px`, `768px`, `1024px`, `1536px`, and
`2048px`; the default is `2048px`. Images are downscaled while preserving their
aspect ratio, and images already below the limit are not enlarged. A smaller
value reduces processing time and memory use but may lose fine detail or small
text. `Original size` skips this app-side downscaling, although the model or
mmproj may still transform the image during preprocessing.

The current llama.cpp runtime also supports compatible GGUF models such as
Bonsai 27B and Agents-A1-4B. Select their model files in the same way as other
GGUF models. Available quantizations, memory requirements, and performance
depend on the model and phone. Start with a smaller quantization on a
smartphone.

For LiteRT-LM, the current app implementation
selects a `.litertlm` model file. `.task` files are not selectable in this
screen. When testing a local LLM from a smartphone, start with Gemma 4 E2B
`gemma-4-E2B-it.litertlm`.

- Repository: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm
- Direct download: https://huggingface.co/litert-community/gemma-4-E2B-it-litert-lm/resolve/main/gemma-4-E2B-it.litertlm

For local LLMs, you can choose CPU or GPU. llama.cpp uses Metal on iOS,
including Metal processing for TQ2_0 quantized models. On Android, the optimized
OpenCL backend is available on compatible Qualcomm Adreno devices. MediaTek,
Pixel, and other Android devices fall back to CPU, as does any device where GPU
initialization fails. When llama.cpp uses GPU, adjust the GPU layer count. Lower
it if the GPU backend is unstable or runs out of memory.

llama.cpp and LiteRT-LM provide warmup buttons. Use them to confirm that the
model loads correctly. LiteRT-LM also has `VLM image warmup`, which verifies
initialization with image input.

Selected GGUF, LiteRT-LM, and mmproj files are imported into app-managed
storage. `Clear imported LLM files` removes the local LLM files and saved model
paths from the app, but does not delete the original external files.

`gpt-oss Flash MoE pack` and `LLM Debug Chat` are limited to special
development builds. Their settings and screens are not shown and cannot be
used in normal TestFlight or Google Play builds.

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

- Voice line when shaken
- Voice line when petted for each affection level
- Voice line when connected for each affection level
- Enable/disable `Step-based connection voice` and edit candidates by step range
- Add and delete reaction voice lines

Tap `Save` after editing. Tap `Reset defaults` to reset the current tab.

The petting voice lines are used when Stack-chan sends petting or touch events.
The shaken voice lines are used when Stack-chan sends `shake` or `start` events.
Connection greeting voice lines are used for the greeting played after
connecting from the first connection screen. When camera master check is
enabled, the app applies the recognition result before choosing from the
affection-level candidates.
Step-based connection voice lines are used above 1,000 steps when the step range
has changed since the previous connection on the same day. This requires step
data from compatible firmware.
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

## 12. Memories And Diary

Use the `Memories` icon on the conversation screen to review logs, photos, and
diaries by date.

When compatible firmware reports steps, the screen also shows the daily step
count. From photo details, you can save an image to the phone's photo library.
In `Per device` character mode, memories and diaries are shown for the currently
connected character.

A diary can be generated when the selected day has at least 5 eligible
conversation or photo logs. In `Settings > Memories and diary`, you can adjust
auto generation, diary boundary time, master-only filtering, photo saving,
pre-summary behavior, and diary prompts.

See [Memories And Diary](diary.md) for detailed usage.

## 13. Debug

Open `Settings > Debug` to temporarily change affection for the current
session.

For step greeting checks, a debug option can repeat the voice on every
connection even when the same step range was already used that day.

Special development builds may show `LLM Debug Chat`. This developer tool can
test llama.cpp directly without connecting to Stack-chan and, when the runtime
reports them, show prefill/decode speed and memory information. It is not shown
in normal distribution builds.

This is for behavior checks. Normal users do not need to change it.

## 14. Licenses

Open `Settings > Licenses` to view bundled license and NOTICE information.

## 15. Privacy

If you configure external APIs such as OpenAI API, an OpenAI compatible API, or
Gemini API, texts, recognition results, images, or parts of conversation history
may be sent to those external services.

See:

- [PRIVACY_en.md](../../PRIVACY_en.md)
- [THIRD_PARTY_LICENSES_en.md](../../THIRD_PARTY_LICENSES_en.md)

## 16. Troubleshooting

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
