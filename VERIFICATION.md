# Verification — 1.2.1

Checked on Windows with Chrome, Chrome's installed YouTube Music app, and Discord desktop. Actual activity rendering was inspected through the same account's Discord web profile.

## Automated checks

- 29 JavaScript tests cover activity construction, privacy, settings, collection, source selection, reconnect handling, and autosave behavior. Clock assertions cover cumulative timelines, per-song seek values, visible-clock fallback, hour-long tracks, and missing clocks.
- 20 isolated native-protocol checks cover framing, handshake, acknowledgements, delayed responses, PING/PONG, deduplication, and song changes. Mock pipes don't contact the real Discord client.
- The packaged executable starts, rejects an invalid application ID through its framed protocol, and exits cleanly. That smoke check doesn't connect to Discord.

## Live playback checks

- The installed app published a real song, artist, artwork, and progress to the actual Discord profile. Manual Next changed the activity.
- Two simultaneously playing sources cleared activity until a source was chosen. The user confirmed choosing the installed app. Playback resumed from the app after the browser source closed.
- After loading 1.2.1, the app and actual Discord profile showed matching song progress.
- Seeking near a track's end and allowing it to finish automatically advanced to a new song. Both the app and Discord showed 0:09 / 3:45 while the underlying media currentTime was still about 177 seconds. The title, artist, and artwork changed as well. This verifies the cumulative-timer fix through an automatic transition, beyond a manual Next test.

## Scope

The extension is 1.2.1; the unchanged native companion is 1.2.0. The compact layout and autosave were checked in a local browser preview. Actual Chrome popup sizing was corrected after a user-reported startup-width issue. Local previews don't prove all Discord rendering behavior.

These checks cover the observed Windows/Chrome setup. Other operating systems, other browsers, multiple Chrome profiles, and long-duration sleep/wake behavior haven't been verified. The release is unsigned and loaded unpacked; it isn't a Chrome Web Store release.
