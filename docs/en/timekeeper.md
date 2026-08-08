# Time Announcements

[Back to README](../../README_en.md) | [日本語](../ja/timekeeper.md)

With compatible firmware, the app can speak progress and results from Stack-chan stopwatch, timer, Pomodoro, and exact-time challenge features using the configured character and voice.

## Requirements

- Stack-chan or StopWatch firmware with `timekeeper.v1`
- An active connection between the app and Stack-chan
- TTS configured in the app; `No voice` disables spoken announcements
- Firmware with `timekeeper.pomodoro.v1` to change Pomodoro durations from the app

Time announcements use the same character and TTS settings as normal conversation. They are not added to conversation history, memories, or diary material.

## Configure Announcements

Open `Settings > Stopwatch speech`.

- `Time announcements`: enables or disables all time-feature speech.
- `Speech amount`: choose `Quiet`, `Standard`, or `Lively`. Important completion or result events may still be spoken in Quiet mode.
- `Read milliseconds`: includes finer timing in laps and results.
- `Avoid repeating phrases`: when an event has at least five choices, avoids the two most recently used phrases.
- `Voice`: reviews or changes the TTS settings shared with normal conversation.

## Customize Spoken Phrases

Open `Settings > Stopwatch speech > Spoken phrases` to add, edit, or delete phrases for stopwatch, timer, Pomodoro, and exact-time challenge events.

- One saved phrase is selected at random.
- Phrases are stored for the active character.
- Variables shown by the editor, such as `{duration}`, are replaced with the actual time or result.
- Keep at least one phrase for each event.
- Use `Restore defaults` to reset an event to the built-in phrases.

## Configure Pomodoro

Open `Settings > Stopwatch speech > Pomodoro settings`.

- Work duration: 1–120 minutes
- Break duration: 1–60 minutes

When a supported device is connected, the screen loads its current configuration. Saving sends the new configuration to the device. It never changes a running session and applies from the next start. If the device is disconnected or unsupported, the values are saved only in the app; connect a supported device and save again.

## Display-off Behavior

When compatible firmware reports that its display is off, the app treats communication as suspended instead of repeatedly reconnecting. After turning the display back on, allow a moment for reconnection and state synchronization. Announcements that expired during suspension may be skipped to prevent stale or duplicate speech.

## Troubleshooting

- Make sure `Time announcements` and TTS are enabled.
- Confirm that the connected device reports `timekeeper.v1`.
- If Pomodoro settings cannot be sent, confirm `timekeeper.pomodoro.v1` support.
- If `Speech amount` is `Quiet`, also test `Standard` or `Lively`.
- After waking the device display, wait for the connection state to recover.
- Re-sending the same event may not speak it again because duplicate delivery is suppressed.
