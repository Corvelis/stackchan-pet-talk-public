# Memories And Diary

Last updated: 2026-07-20

`StackChan Pet Talk` can save conversations, photos, petting events, master recognition events, and related records as memories. From those memories, the app can write a diary entry from Stack-chan's point of view for a selected day.

You do not need to understand the implementation to use the diary feature. However, the diary style depends on the selected LLM, the amount of logs, and the diary prompts. This page explains how to use the screen and which settings you can adjust.

## 1. What The Diary Feature Does

- Choose a date from the memory calendar
- Review conversations, event logs, and photos from that day
- View the daily step count reported by a compatible Stack-chan
- Use the selected LLM to write a Stack-chan-style diary
- View an existing diary
- Regenerate an existing diary
- Delete only the diary for a day
- Hide the day's logs, photos, and diary together
- Adjust diary prompts and pre-summary behavior

At least 5 eligible conversation or photo logs are required to write a diary. If there are not enough logs, the diary screen shows how many more are needed.

## 2. Open The Diary Screen

1. Open the conversation screen.
2. Tap the `Memories` icon in the top area.
3. Select a date from the calendar.
4. Switch between `Diary`, `Log`, and `Photos`.

The calendar marks days that have memory logs. When the screen opens, it selects "today" based on the configured diary boundary time.

When a compatible Stack-chan reports steps, the screen also shows the daily
step count. Steps currently do not count toward the five required logs and are
not included as diary-generation material.

Memories and diaries belong to the currently selected character. In `Per device`
character mode, switching the connection target also switches the memories shown
to those for that device's character.

## 3. Write A Diary

If the selected day does not have a diary yet, the `Diary` tab shows a `Write diary` button.

1. Open `Memories`.
2. Select the date.
3. Open the `Diary` tab.
4. Tap `Write diary`.
5. The selected LLM writes a diary from that day's memories.

Diary generation uses the current LLM settings. If you choose an external API provider, diary material and prompts may be sent to that provider. If you choose a local LLM, generation runs on the device.

## 4. Regenerate Or Delete

An existing diary shows `Regenerate` and a delete button.

- `Regenerate`: replaces the current diary text with a newly generated one.
- Delete button: deletes only the diary. Logs and photos remain.
- `Delete this day` in the `Log` tab: hides the day's logs, photos, and diary together.

Regenerating can produce different wording from the same logs because LLM settings, prompts, and sampling parameters such as temperature can affect the result.

## 5. Review Logs And Photos

The `Log` tab shows conversations, petting, master recognition, steps, and other
events from the selected day in chronological order.

The `Photos` tab shows photos saved as memories. You can open a photo for details,
save it to the phone's photo library, or hide photos you no longer need.

From the image button on the conversation screen, you can attach an image from
the phone camera, photo library, or a compatible Stack-chan camera to the next
message. Camera or photo permissions may be required.

To include captured photos in diary material, enable `Settings > Memories and diary > Save captured images to memories`. The diary mainly uses text photo notes and image recognition results as material.

## 6. Auto Generation

Enable `Settings > Memories and diary > Auto-generate diary` to let the app create missing diaries after the diary boundary time.

Auto generation runs when:

- The diary tab is showing a past date
- The selected day does not already have a diary
- At least 5 eligible logs exist
- An LLM is available
- `Auto-generate diary` is enabled

Auto generation does not overwrite existing diaries. Use `Regenerate` if you want to replace a diary.

## 7. Diary Boundary

Use `Settings > Memories and diary > Diary boundary` to set the time when diary days switch.

The default is `04:00`. For example, with a `04:00` boundary, a conversation at 1:00 AM belongs to the previous day's diary.

Adjust this time to match your normal daily rhythm.

## 8. Use Only Master Conversations

Enable `Settings > Memories and diary > Use only master conversations` to use only master or unknown conversations and photos as diary material.

This is useful when master recognition is enabled and you do not want guest conversations to appear in the diary.

Notes:

- At least 5 logs are required after filtering.
- Unknown logs are still included.
- If master recognition is unstable, expected logs may be excluded.

## 9. Pre-Summarize With LLM

Enable `Settings > Memories and diary > Pre-summarize with LLM before diary` to summarize the day's logs before writing the final diary.

When enabled:

- Long logs are easier to fit into the diary prompt.
- Local LLM context limits are easier to handle.
- The final diary depends on what the pre-summary keeps.

When disabled:

- Eligible logs are inserted more directly into the diary prompt.
- Short days may be reflected more directly.
- Long days may fail more often with local LLMs.

API providers such as OpenAI API, Gemini API, and OpenAI compatible API may handle longer input than local LLMs. For local LLMs, the app may split long logs and summarize the chunks so the final prompt fits the model context.

## 10. Adjust Diary Prompts

Open `Settings > Memories and diary` to adjust diary prompts.

Prompt fields:

- `Diary pre-summary prompt`: instruction used when turning raw logs into diary material.
- `iOS/default diary prompt`: final diary prompt used on iOS and the default path.
- `Default/API diary prompt`: final diary prompt shown on Android for the default/API path.
- `Android LiteRT-LM diary prompt`: final diary prompt used only for Android LiteRT-LM. It is shown only on Android.

Changing prompts affects the diary tone, length, heading style, and final note.

If you are unsure, tap `Reset defaults`. This restores the diary prompts and pre-summary prompt to the default text for the current app language.

## 11. Prompt Variables

Diary prompts can use variables that are replaced automatically at generation time.

Common variables:

- `{characterName}`: character name used for the diary writer
- `{characterStyle}`: combined instructions for name, first person, and affection level
- `{memoryMaterial}`: main material passed to the final diary prompt
- `{memoryPreSummary}`: LLM pre-summary result
- `{rawMemoryLogs}`: eligible raw logs
- `{dailyEvents}`: symbolic events from the selected day
- `{conversationHighlights}`: short conversation highlights
- `{photoDescriptions}`: photo notes and image recognition text
- `{pettingSummary}`: petting and master recognition summary

`{memoryMaterial}` is usually the easiest variable to use. It contains the pre-summary when pre-summary is enabled, otherwise it contains eligible logs.

`{rawMemoryLogs}` can be long, so be careful with local LLM context limits.

## 12. External APIs And Privacy

If you use an external API LLM, information needed for diary generation may be sent to the API provider.

This may include:

- Diary prompts
- Conversation logs from the selected day
- Photo notes and image recognition results
- Parts of character settings
- Affection-based writing hints

Whether image files themselves are sent depends on the feature and LLM configuration. The diary feature mainly uses text photo notes and image recognition results.

See the [Privacy Policy](../../privacy/en.md) for more details.

## 13. Troubleshooting

`Write diary` is disabled:

- Check that the selected day has at least 5 conversation or photo logs.
- If `Use only master conversations` is enabled, there may not be enough logs after filtering.

The diary feels too generic:

- Check the `Log` tab to confirm that the day has enough concrete conversations or photos.
- Try enabling `Pre-summarize with LLM before diary`.
- If you changed prompts, try `Reset defaults`.
- Adjust LLM settings such as temperature, topK, and topP.

Local LLM generation fails:

- Check that the LiteRT-LM or llama.cpp model file is selected correctly.
- Check context size, max tokens, temperature, and related LLM settings.
- Enable pre-summary for days with many logs.
- Try the model warmup button.

Markdown display looks wrong:

- If you changed prompts, try `Reset defaults`.
- On Android LiteRT-LM, the Android-specific diary prompt usually keeps display formatting more stable.

External API generation fails:

- Check API key, Base URL, and model name.
- If a real phone connects to an OpenAI compatible API server on your PC, use the PC LAN IP instead of `localhost`.
- Check provider limits and network connection.
