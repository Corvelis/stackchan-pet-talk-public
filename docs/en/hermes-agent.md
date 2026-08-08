# Using Hermes Agent

[Back to README](../../README_en.md) | [日本語](../ja/hermes-agent.md)

`Hermes Agent` lets StackChan Pet Talk use a user-provided Hermes API server as its conversation LLM. The app does not include a Hermes server or API key.

In addition to normal LLM responses, Hermes may use server-side skills, tools, and Agent Memory. Available features and retention behavior depend on the server you choose and how it is configured.

## Configure Hermes

1. Open `Settings > LLM`.
2. Select `Hermes Agent` as the provider.
3. Enter the server base URL in `Hermes URL`. Do not append an individual API path such as `/api/sessions`.
4. Enter the `API Key` issued by the server.
5. Tap `Hermes 接続確認` (`Hermes connection check`).
6. After the required capabilities pass, save the settings and return to the conversation screen.

HTTPS is recommended for connections over the Internet. Use only a server and API key that you trust.

## Connection Check Results

The connection check uses the server's `/health`, capabilities, and toolsets endpoints to report:

- `Sessions`: conversation session creation and retrieval
- `SSE`: streamed conversation responses
- `Skills`: server-side skills API
- `Hermes Agent Memory`: whether the memory toolset is enabled and configured
- `Tool progress`: tool start, progress, completion, and failure events
- `Diary generation`: streaming Chat Completions

Conversation requires both `Sessions` and `SSE`. Using Hermes for diary generation also requires `Diary generation`. Skills, Agent Memory, and tool progress are optional and depend on the server configuration.

If `Hermes Agent Memory` says that its check failed, conversation may still work. Check the server toolsets API, the memory toolset, and the active connection profile.

## Conversation and Tools

Conversations using Hermes Agent are processed as server-side sessions. When the server supports tool progress, the app shows progress updates in its event area.

Images sent to Hermes must be under 2 MB each. Resize a larger image before attaching it. Available image handling and tools depend on the server configuration.

## Hermes Conversation History

Open `Settings > LLM > Hermes 会話履歴` (`Hermes conversation history`) to list sessions stored on the configured server. Open a session to review user and assistant messages and any recorded tool details.

In the current beta, some Hermes-specific button labels and the history screen are displayed in Japanese even when the rest of the app uses English.

This is server-side Hermes history, not only the app's local conversation list. Review the server operator's policy for deletion, retention, and administrative access.

## Privacy Notes

When Hermes Agent is selected, text, prompts, conversation context, images, and session information may be sent to the configured server. Depending on its configuration, server-side skills and tools may contact other services or store information in Agent Memory.

See the [Privacy Policy](../../privacy/en.md) for details.

## Troubleshooting

- Make sure the URL is a valid base URL beginning with `http://` or `https://`.
- Check the API key, server health, TLS certificate, and firewall.
- While connected through Stack-chan SoftAP, make sure mobile data is enabled on the phone.
- If `Sessions` or `SSE` is unsupported, update or reconfigure the Hermes server.
- If only diary generation fails, check streaming Chat Completions support.
