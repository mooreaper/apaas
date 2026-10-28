# AP African American Studies — Unit Diagnostic

Single-file interactive diagnostic for **AP African American Studies** (College Board CED, Fall 2024), covering Units 1–4.

## Open the app

Open [`index.html`](index.html) in any modern browser (Chrome, Edge, Firefox, Safari). No build step or server required.

## Features

- **Unit selector** for Units 1–4 (all CED topics: 1.1–1.11, 2.1–2.24, 3.1–3.18, 4.1–4.21)
- **One fill-in-the-blank question per topic**, tied to Learning Objectives and required sources
- **Drag-and-drop word bank** with tap-to-select fallback for tablets/phones
- **Optional timer** (count-up or countdown: 15 / 30 / custom minutes)
- **Diagnostic report** with percentage score, elapsed time, and missed objectives
- **Reteach modules** with Essential Knowledge review and mini-simulations
- **Print / Save as PDF** via browser print dialog
- **Deep links:** `index.html?unit=1` (also `?unit=2&timer=1&mode=down&minutes=30`)

## Disclaimer

Study aid aligned to the College Board AP African American Studies Course and Exam Description. Not affiliated with or endorsed by College Board. Source titles reference the CED and commonly paired archives (Smithsonian NMAAHC, Gilder Lehrman Institute).

## Regenerating content (optional)

PowerShell build scripts in this repo can regenerate `index.html`:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1
```
