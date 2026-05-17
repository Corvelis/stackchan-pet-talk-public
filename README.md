# stackchan-talk

`stackchan-talk` is a clean Flutter app for everyday Stack-chan conversation.
It is intentionally separated from the existing `voice_llm_studio` experiment app.

The first milestone focuses on the app shell, UI structure, documents, and the design base for future Stack-chan connection work. ASR, LLM, TTS, native bridges, Android background service, and recognition implementations are not migrated in M1.

## M1 Scope

- Setup connection screen for SoftAP and STA/IP connection paths
- Main conversation screen with Stack-chan state, speaker identity, affection, familiarity, bubbles, mic button, and text input
- Settings category screen
- Character settings skeleton for base prompt, master name, affection levels, reactions, prompt preview, and test area
- In-app UI language switching for Japanese and English
- Split Flutter structure for screens, widgets, theme, and models
- Initial Stack-chan connection protocol/client interfaces with dummy implementation
- Dummy-only connection and conversation state

## Release Direction

The first public release is planned around:

- Stack-chan WebSocket connection
- SoftAP / STA connection
- Stack-chan microphone input and speaker output
- ReazonSpeech ASR
- Piper Plus TTS
- OpenAI compatible API and optional OpenAI API
- llama.cpp
- LiteRT-LM CPU/GPU
- Master face recognition and master voice recognition
- Conversation tone switching for `master`, `guest`, and `unknown`
- Affection and familiarity levels
- Character settings editor
- Lightweight conversation history
- Android Foreground Service for background conversation

Out of initial scope:

- NPU / QAIRT / QNN
- Agent skills
- Agentic or semantic memory
- Translation
- Toio
- Unity / Live2D
- MioTTS
- Style-Bert-VITS2
- Moonshine
- Qwen3 ASR
- BLE/Wi-Fi pass-by features

## Implementation Policy

- The app/repo/display name is `stackchan-talk`.
- The Dart package name remains `stackchan_talk` because Dart package names cannot contain hyphens.
- Android and Apple bundle identifiers use `app.stackchan.talk`.
- Existing `voice_llm_studio` code is reference-only and must not be modified from this project.
- Common package extraction is intentionally deferred.
- Only necessary code will be manually migrated in later phases.
- No model files, SDKs, or prebuilt binaries are bundled in this repository at this stage.

## Reference-Only Sources

The current reference implementation lives outside this repository:

`/Users/yuma/workspace/flutter_app/paie_agent/llamacpp_test_app/asr_llmplay/voice_llm_studio_gemma4_unity_20260407`

Relevant areas for later manual migration include Stack-chan WebSocket/audio, camera, affection/style, Piper Plus, ASR/ReazonSpeech, LLM services, and face/voice recognition. M1 does not copy or port those implementations.

## Privacy and Recognition Notes

Master recognition is planned as an optional local-only character interaction feature. It is not a security or access-control feature and must not be presented as authentication.

## Development

```sh
flutter analyze
flutter test
flutter run
```

Mobile build checks verified in the local M1 setup:

```sh
flutter build apk
flutter build ios --simulator
```

iPhone device builds require the usual Apple Developer signing setup in Xcode.
