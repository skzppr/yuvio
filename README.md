<p align="center"><img src="extension/assets/logo.png" width="128" alt="Yuvio mascot"></p>
<h1 align="center">Yuvio</h1>
<p align="center">Your music. A little more you.</p>
<p align="center">YouTube Music Rich Presence for Discord · Chrome + Windows</p>

I wanted my YouTube Music activity on Discord to feel clean and easy to use, with the settings right in the extension. That's Yuvio: a compact, dark-mode popup that shares what you're listening to and lets you make it your own.

It works with YouTube Music tabs and Chrome's installed YouTube Music app. No Discord developer account, bot, or personal application setup needed.

## Download

Open this repository's **Releases** section and download **YouTube-Music-Presence-1.2.1.zip** from the release assets.

Use that ZIP for installation. GitHub's automatic **Source code** downloads contain the development files, without the built Windows companion.

**Requires Windows x64, Google Chrome, and Discord desktop.** This release uses Chrome's Load unpacked option; it is not on the Chrome Web Store.

## Setup

1. Extract the release ZIP somewhere permanent. Keep the entire folder together.
2. Open `chrome://extensions` in Chrome and turn on **Developer mode**.
3. Click **Load unpacked** and select the extracted `extension` folder.
4. Run **Install companion.cmd** from the extracted parent folder. It registers the local companion for your Windows user; administrator access isn't needed.
5. Open Discord desktop and make sure activity sharing is enabled.
6. Refresh YouTube Music, play a song, then open Yuvio and choose **Connect → Connect Discord**.

Yuvio uses the account already signed in to Discord desktop. It never asks for your Discord token or password. The Windows companion is required because a Chrome extension cannot communicate with Discord's local connection by itself. Node.js and .NET are not required for the release download.

## Make it yours

- **Presence:** show the song, artist, or Yuvio next to your name; customize text templates, links, and button labels.
- **Style:** choose an accent color, show or hide artwork and progress, and set what happens when playback pauses.
- **Privacy:** temporarily stop sharing, hide ads, or exclude specific artists.
- **Connect:** see the local Discord connection and the profile it's using.

Everything lives in the compact popup. Valid changes save automatically, and the preview updates while you edit. The interface stays in dark mode.

If both a browser tab and the installed app are playing, Yuvio asks which one to follow. Your choice stays selected through track changes. If that player stops or closes and another is playing, Yuvio follows the remaining player. It doesn't pause your music or change your queue.

## What's fixed in 1.2.1

Progress now follows YouTube Music's per-song clock. Automatic transitions no longer carry the previous song's elapsed time into the next track. If the per-song clock briefly disappears, Yuvio leaves progress out until it returns.

Songs from the same album can share the same cover. An unchanged cover is expected when the album hasn't changed.

## Updating and uninstalling

Use the same permanent folder to preserve your extension settings. Close music windows and reload Yuvio to let its companion exit before replacing a running executable. Extract the new release into that folder, reload Yuvio in `chrome://extensions`, and refresh every YouTube Music tab or app window. If you move the package, run **Install companion.cmd** from its new location to update the companion path.

To uninstall, run **Uninstall companion.cmd**, then remove Yuvio from Chrome. The uninstaller leaves your downloaded files in place.

## Troubleshooting

| What you see | What to check |
| --- | --- |
| No track detected | Refresh YouTube Music after installing or updating, then play a song. |
| Two players are playing | Choose the installed app or browser tab in the popup. |
| Discord won't connect | Open Discord desktop, run the companion installer, then try Connect Discord again. Keep the package folder in place. |
| Connected, but no activity | Check Yuvio's sharing/privacy settings and Discord's activity-sharing settings. |

## Privacy and limits

Yuvio only reads playback from `music.youtube.com`. Settings stay in your Chrome profile. Current playback and connection status are transient; Yuvio doesn't store listening history, collect account tokens, use telemetry, or run a cloud backend.

The companion communicates with Discord locally. Discord receives the song text, public links, and artwork you choose to share. Use one configured Chrome profile to avoid competing companion instances.

Discord controls the final layout; the popup preview is an approximation. Spotify account linking and synchronized Listen Along aren't included. Playback on other devices isn't detected. The Windows executable is currently unsigned.

## Development

Manifest V3 and JavaScript for the extension; .NET 10 for the Windows companion. Development requires Node.js and a .NET 10 SDK on Windows.

```powershell
npm test
dotnet run --project tests/ProtocolTests/ProtocolTests.csproj
npm run build
npm run verify:package
```

The build creates the installable folder and versioned ZIP in `dist`. If this checkout's companion is running, use `scripts/build.ps1 -UpdateRunningCompanion` to back up and replace that instance. The extension's public manifest key keeps its ID stable; it isn't a private signing key.

For a local settings preview, run `npm run preview` and open `http://127.0.0.1:4318/popup.html`. The preview doesn't connect to Discord. See [VERIFICATION.md](VERIFICATION.md) for coverage and live checks.

Independent project. Not affiliated with YouTube, Google, Discord, or Spotify.
