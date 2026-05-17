# Privacy

`stackchan-talk` is planned as a local-first Stack-chan conversation app.

M1 uses dummy UI state only. It does not implement microphone capture, speaker streaming, ASR, TTS, LLM calls, face recognition, voice recognition, background conversation, or model downloads.

Planned privacy principles:

- Keep Stack-chan microphone and speaker data local unless the user explicitly configures a remote API.
- Make OpenAI compatible API and OpenAI API usage optional and clearly configurable.
- Keep master face and voice recognition local-only where supported.
- Treat master recognition as character interaction only, not authentication, security, or access control.
- Keep lightweight conversation history user-visible and removable.
- Document Android Foreground Service behavior before background conversation is enabled.

No model files, SDKs, or prebuilt binaries are bundled in this repository at this stage.
