# Release Notes

[Back to README](../../README_en.md) | [日本語](../ja/release-notes.md)

## 1.0.6 (48)

- Added phone-camera remote capture from compatible StopWatch firmware. Users
  can choose the front or back camera and automatically attach the captured
  photo to the next text or voice conversation.
- Added image preprocessing and KV-cache reuse for llama.cpp VLMs to reduce the
  time before an image-based response starts.
- Improved streaming chat updates for smoother display of long responses.
- Added the llama.cpp OpenCL GPU backend on compatible Qualcomm Adreno devices
  on Android. Unsupported devices and initialization failures automatically
  fall back to CPU.
- Added Metal processing support for TQ2_0 quantized llama.cpp models on iOS.
- Improved the active CPU/GPU display and diagnostic information for local LLMs.

### Notes

- StopWatch remote capture requires compatible firmware. Mobile OS restrictions
  allow the camera screen to open automatically only while the phone app is in
  the foreground.
- GPU availability and performance depend on the phone, model, and quantization.
- Local LLM/VLM use requires a compatible GGUF, mmproj, or LiteRT-LM model
  supplied by the user.

See the [User Guide](user-manual.md) for setup and usage details.
