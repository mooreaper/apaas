# Build complete index.html for AP AAS Unit Diagnostic
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

# Load Units 1-2 (defines function T and $units)
. .\generate.ps1
# Load Units 3-4 arrays
. .\generate-u34.ps1

$units["3"] = [ordered]@{
  id = 3
  title = 'The Practice of Freedom'
  shortTitle = 'The Practice of Freedom'
  examWeight = '20–25%'
  periods = '~28 class periods'
  blurb = 'Reconstruction, Jim Crow, institutions, and migration (1865–1940s).'
  topics = $global:APAAS_U3
}
$units["4"] = [ordered]@{
  id = 4
  title = 'Movements and Debates'
  shortTitle = 'Movements and Debates'
  examWeight = '20–25%'
  periods = '~30 class periods'
  blurb = 'Anticolonial thought, civil rights, Black Power, culture, and futures (1940s–2000s).'
  topics = $global:APAAS_U4
}

foreach ($k in 1..4) {
  Write-Host "Unit $k topics: $($units["$k"].topics.Count)"
  if ($units["$k"].topics.Count -lt 1) { throw "Unit $k empty" }
}

# Convert units to JSON for embedding (depth high)
$dataForJson = [ordered]@{}
foreach ($k in 1..4) { $dataForJson["$k"] = $units["$k"] }
$json = $dataForJson | ConvertTo-Json -Depth 12 -Compress:$false

# Escape script-breaking sequences in JSON when embedded in <script>
$jsonSafe = $json -replace '</script>', '<\/script>'

$htmlHead = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>AP African American Studies | Unit Diagnostic</title>
<meta name="description" content="Interactive unit diagnostic for AP African American Studies (Units 1–4), aligned to the College Board CED." />
<style>
:root{
  --navy:#1A2B4C; --blue:#0056B3; --gold:#D99B26; --ochre:#E07A5F; --cream:#F9F8F3;
  --hint-bg:#f0fdf4; --hint-border:#86efac; --hint-text:#15803d;
  --ink:#1a1a1a; --muted:#5c6578; --line:#d9dde6; --white:#fff; --danger:#b91c1c; --ok:#15803d;
  --shadow:0 10px 30px rgba(26,43,76,.12); --radius:14px; --font: "Segoe UI", system-ui, -apple-system, sans-serif;
}
*{box-sizing:border-box}
html{scroll-behavior:smooth}
body{margin:0;font-family:var(--font);background:linear-gradient(180deg,#eef2f8 0%,var(--cream) 220px);color:var(--ink);min-height:100vh;line-height:1.5}
a{color:var(--blue)}
.app-header{background:var(--navy);color:#fff;padding:1rem 1.25rem;position:sticky;top:0;z-index:40;box-shadow:var(--shadow)}
.app-header-inner{max-width:1100px;margin:0 auto;display:flex;flex-wrap:wrap;gap:.75rem 1.25rem;align-items:center;justify-content:space-between}
.brand{display:flex;flex-direction:column;gap:.15rem}
.brand strong{font-size:1.05rem;letter-spacing:.02em}
.brand span{font-size:.8rem;opacity:.85}
.header-meta{display:flex;align-items:center;gap:1rem;flex-wrap:wrap}
.timer-chip{display:none;align-items:center;gap:.5rem;background:rgba(255,255,255,.12);border:1px solid rgba(255,255,255,.25);padding:.35rem .7rem;border-radius:999px;font-variant-numeric:tabular-nums;font-weight:600}
.timer-chip.warn{background:rgba(224,122,95,.25);border-color:var(--ochre)}
.timer-chip.critical{background:rgba(185,28,28,.35);border-color:#fecaca}
.btn{appearance:none;border:none;border-radius:10px;padding:.65rem 1rem;font-weight:650;cursor:pointer;font:inherit;transition:transform .15s, box-shadow .15s, background .15s}
.btn:focus-visible,.chip:focus-visible,.blank:focus-visible,details summary:focus-visible{outline:3px solid var(--gold);outline-offset:2px}
.btn-primary{background:var(--gold);color:var(--navy)}
.btn-primary:hover{filter:brightness(1.05)}
.btn-secondary{background:#fff;color:var(--navy);border:2px solid rgba(255,255,255,.5)}
.btn-secondary.dark{border-color:var(--navy)}
.btn-ghost{background:transparent;color:#fff;border:1px solid rgba(255,255,255,.35)}
.btn-danger{background:var(--ochre);color:#fff}
.btn:disabled{opacity:.55;cursor:not-allowed}
main{max-width:1100px;margin:0 auto;padding:1.25rem}
.screen{display:none}
.screen.active{display:block;animation:fade .25s ease}
@keyframes fade{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:none}}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition:none!important}html{scroll-behavior:auto}}
.hero{background:var(--white);border-radius:var(--radius);padding:1.5rem;box-shadow:var(--shadow);border:1px solid var(--line);margin-bottom:1.25rem}
.hero h1{margin:0 0 .5rem;color:var(--navy);font-size:clamp(1.4rem,2.5vw,2rem)}
.hero p{margin:0;color:var(--muted);max-width:65ch}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(230px,1fr));gap:1rem}
.card{background:var(--white);border:1px solid var(--line);border-radius:var(--radius);padding:1.15rem;box-shadow:var(--shadow);display:flex;flex-direction:column;gap:.65rem;min-height:100%}
.card h2{margin:0;color:var(--navy);font-size:1.15rem}
.badge{display:inline-flex;align-items:center;gap:.35rem;background:rgba(0,86,179,.1);color:var(--blue);font-weight:700;font-size:.75rem;padding:.2rem .55rem;border-radius:999px;width:fit-content}
.card p{margin:0;color:var(--muted);font-size:.92rem;flex:1}
.panel{background:var(--white);border:1px solid var(--line);border-radius:var(--radius);padding:1.25rem;box-shadow:var(--shadow);margin-bottom:1rem}
.panel h2,.panel h3{margin-top:0;color:var(--navy)}
.field{display:flex;flex-direction:column;gap:.35rem;margin:.75rem 0}
.field label{font-weight:650;color:var(--navy)}
.row{display:flex;flex-wrap:wrap;gap:.75rem;align-items:center}
input[type="number"],select,input[type="text"]{font:inherit;padding:.55rem .7rem;border:1px solid var(--line);border-radius:8px;background:#fff;min-width:0}
.switch{display:flex;align-items:center;gap:.6rem;font-weight:650;color:var(--navy)}
.word-bank-wrap{position:sticky;top:72px;z-index:30;background:rgba(249,248,243,.95);backdrop-filter:blur(6px);padding:.75rem 0 .5rem;margin-bottom:.5rem;border-bottom:1px solid var(--line)}
.word-bank{display:flex;flex-wrap:wrap;gap:.5rem}
.chip{background:var(--navy);color:#fff;padding:.45rem .7rem;border-radius:999px;cursor:grab;user-select:none;font-weight:600;font-size:.9rem;border:2px solid transparent}
.chip:active{cursor:grabbing}
.chip.selected{border-color:var(--gold);box-shadow:0 0 0 3px rgba(217,155,38,.35)}
.chip.used{opacity:.35;cursor:default}
.help{font-size:.85rem;color:var(--muted);margin:.25rem 0 .75rem}
.q{border:1px solid var(--line);border-radius:12px;padding:1rem;margin:0 0 .9rem;background:#fff}
.q-head{display:flex;justify-content:space-between;gap:.75rem;flex-wrap:wrap;margin-bottom:.35rem}
.q-id{font-weight:800;color:var(--blue)}
.lo{font-size:.82rem;color:var(--muted)}
.stem{font-size:1.02rem}
.blank{display:inline-flex;min-width:9ch;min-height:1.6em;padding:0 .4rem;margin:0 .15rem;border-bottom:3px solid var(--blue);background:rgba(0,86,179,.06);border-radius:4px 4px 0 0;vertical-align:baseline;align-items:center;justify-content:center;font-weight:700;color:var(--navy);cursor:pointer}
.blank.filled{background:rgba(217,155,38,.15);border-bottom-color:var(--gold)}
.blank.active{box-shadow:0 0 0 3px rgba(0,86,179,.25)}
.sources{font-size:.82rem;color:var(--muted);margin-top:.45rem}
.hint{margin-top:.65rem;background:var(--hint-bg);border:1px solid var(--hint-border);color:var(--hint-text);border-radius:10px;padding:.55rem .75rem}
.hint summary{cursor:pointer;font-weight:750;list-style:none}
.hint summary::-webkit-details-marker{display:none}
.hint summary::before{content:"💡 ";}
.actions{display:flex;flex-wrap:wrap;gap:.75rem;margin:1rem 0 2rem}
.score-hero{display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:1rem;margin:1rem 0}
.stat{background:var(--navy);color:#fff;border-radius:12px;padding:1rem}
.stat .label{font-size:.8rem;opacity:.85}
.stat .value{font-size:1.6rem;font-weight:800}
.stat.gold{background:linear-gradient(135deg,var(--navy),var(--blue))}
.missed{border-left:4px solid var(--ochre)}
.ok-row{border-left:4px solid var(--ok)}
.topic-row{padding:.75rem 1rem;background:#fff;border:1px solid var(--line);border-radius:10px;margin:.5rem 0}
.sim{background:#f7f9fc;border:1px dashed var(--blue);border-radius:12px;padding:1rem;margin-top:.75rem}
.sim label{display:block;margin:.35rem 0;padding:.45rem .6rem;border-radius:8px;border:1px solid var(--line);background:#fff;cursor:pointer}
.sim label:has(input:checked){border-color:var(--blue);background:rgba(0,86,179,.06)}
.feedback{margin-top:.6rem;padding:.6rem .75rem;border-radius:8px;font-weight:600}
.feedback.good{background:var(--hint-bg);color:var(--hint-text);border:1px solid var(--hint-border)}
.feedback.bad{background:#fef2f2;color:var(--danger);border:1px solid #fecaca}
.footer{max-width:1100px;margin:2rem auto;padding:0 1.25rem 2rem;color:var(--muted);font-size:.8rem}
.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
.toast{position:fixed;bottom:1rem;right:1rem;background:var(--navy);color:#fff;padding:.75rem 1rem;border-radius:10px;box-shadow:var(--shadow);display:none;z-index:50}
.toast.show{display:block}
@media print{
  body{background:#fff}
  .app-header .btn-ghost,.no-print,.word-bank-wrap,.hint,.actions .btn-secondary,.sim input,.toast{display:none!important}
  .screen{display:none!important}
  #screen-report{display:block!important}
  .app-header{position:static;box-shadow:none;background:#fff;color:#000;border-bottom:2px solid #000}
  .brand span,.timer-chip{color:#000!important;opacity:1}
  .stat{break-inside:avoid;background:#fff!important;color:#000!important;border:1px solid #000}
  .panel,.topic-row,.card,.q{box-shadow:none;break-inside:avoid}
  a[href]::after{content:""}
}
</style>
</head>
<body>
<a class="sr-only" href="#main">Skip to content</a>
<header class="app-header">
  <div class="app-header-inner">
    <div class="brand">
      <strong>AP African American Studies</strong>
      <span id="headerSubtitle">Unit Diagnostic Study Aid</span>
    </div>
    <div class="header-meta">
      <div class="timer-chip" id="timerChip" aria-live="polite"><span>⏱</span><span id="timerDisplay">00:00</span></div>
      <button type="button" class="btn btn-ghost no-print" id="btnHome" hidden>All Units</button>
    </div>
  </div>
</header>
<main id="main">
  <section class="screen active" id="screen-select" aria-labelledby="selectTitle">
    <div class="hero">
      <h1 id="selectTitle">Choose a Unit Diagnostic</h1>
      <p>One fill-in-the-blank question per CED topic, with word-bank support, optional timer, automatic reteach modules, and print/PDF export. Aligned to the College Board Course and Exam Description (Fall 2024).</p>
    </div>
    <div class="grid" id="unitGrid"></div>
  </section>

  <section class="screen" id="screen-setup" aria-labelledby="setupTitle">
    <div class="panel">
      <h2 id="setupTitle">Diagnostic Setup</h2>
      <p id="setupBlurb" class="help"></p>
      <div class="field">
        <label class="switch"><input type="checkbox" id="timerEnabled" /> Enable Timer</label>
      </div>
      <div id="timerOptions" hidden>
        <div class="field">
          <label for="timerMode">Timer mode</label>
          <select id="timerMode">
            <option value="up">Count-Up (elapsed)</option>
            <option value="down">Count-Down</option>
          </select>
        </div>
        <div class="field" id="countdownFields" hidden>
          <label>Countdown length</label>
          <div class="row">
            <button type="button" class="btn btn-secondary dark" data-mins="15">15 min</button>
            <button type="button" class="btn btn-secondary dark" data-mins="30">30 min</button>
            <label class="row">Custom <input type="number" id="customMinutes" min="1" max="180" value="20" style="width:5rem" /> min</label>
          </div>
        </div>
      </div>
      <div class="actions">
        <button type="button" class="btn btn-secondary dark" id="btnBackSelect">Back</button>
        <button type="button" class="btn btn-primary" id="btnStart">Start Diagnostic</button>
      </div>
    </div>
  </section>

  <section class="screen" id="screen-assess" aria-labelledby="assessTitle">
    <div class="hero" style="padding:1rem 1.25rem">
      <h1 id="assessTitle" style="font-size:1.35rem;margin:0">Assessment</h1>
      <p class="help" style="margin:.35rem 0 0">Drag a term from the word bank into each blank, or tap a term then tap a blank (touch-friendly). Hints reference CED learning objectives and required sources.</p>
    </div>
    <div class="word-bank-wrap no-print">
      <div class="help" id="bankHelp">Word Bank — drag or tap to fill blanks. Selected term: <strong id="selectedTermLabel">none</strong></div>
      <div class="word-bank" id="wordBank" role="listbox" aria-label="Word bank"></div>
    </div>
    <div id="questionList"></div>
    <div class="actions no-print">
      <button type="button" class="btn btn-secondary dark" id="btnCancelAssess">Cancel</button>
      <button type="button" class="btn btn-primary" id="btnSubmit">Submit Diagnostic</button>
    </div>
  </section>

  <section class="screen" id="screen-report" aria-labelledby="reportTitle">
    <div class="panel">
      <h2 id="reportTitle">Diagnostic Report</h2>
      <p id="reportUnitLine" class="help"></p>
      <div class="score-hero" id="scoreHero"></div>
      <div class="actions no-print">
        <button type="button" class="btn btn-primary" id="btnPrint">Print / Save as PDF</button>
        <button type="button" class="btn btn-danger" id="btnReteach" hidden>Open Reteach Modules</button>
        <button type="button" class="btn btn-secondary dark" id="btnRetake">Retake Unit</button>
        <button type="button" class="btn btn-secondary dark" id="btnNewUnit">Choose Another Unit</button>
      </div>
      <h3>Topic Results</h3>
      <div id="topicResults"></div>
      <div id="printAnswerKey" hidden></div>
    </div>
  </section>

  <section class="screen" id="screen-reteach" aria-labelledby="reteachTitle">
    <div class="panel">
      <h2 id="reteachTitle">Targeted Reteach Modules</h2>
      <p class="help">Modules open for missed topics only. Review Essential Knowledge, then complete the mini-simulation.</p>
      <div id="reteachList"></div>
      <div class="actions no-print">
        <button type="button" class="btn btn-secondary dark" id="btnBackReport">Back to Report</button>
        <button type="button" class="btn btn-primary" id="btnPrintFromReteach">Print Report</button>
      </div>
    </div>
  </section>
</main>
<footer class="footer">
  Study aid aligned to the College Board AP African American Studies Course and Exam Description (effective Fall 2024). Required source titles reference the CED and commonly paired archives (Smithsonian NMAAHC, Gilder Lehrman Institute). Not affiliated with or endorsed by College Board. Teachers may deep-link with <code>?unit=1</code> through <code>?unit=4</code> (optional <code>&amp;timer=1&amp;mode=down&amp;minutes=30</code>).
</footer>
<div class="toast" id="toast" role="status"></div>
<script>
const unitsData = 
'@

$htmlTail = @'
;

(function () {
  'use strict';
  const state = {
    unitId: null,
    answers: {},
    selectedChip: null,
    activeBlank: null,
    timer: { enabled: false, mode: 'up', durationSec: 0, startedAt: 0, elapsedSec: 0, interval: null, countdownRemain: 0 },
    results: null,
    reteachDone: {}
  };

  const $ = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));

  function showScreen(id) {
    $$('.screen').forEach(s => s.classList.toggle('active', s.id === id));
    $('#btnHome').hidden = id === 'screen-select';
  }

  function toast(msg) {
    const el = $('#toast');
    el.textContent = msg;
    el.classList.add('show');
    setTimeout(() => el.classList.remove('show'), 2600);
  }

  function normalize(s) {
    return String(s || '').trim().toLowerCase().replace(/\s+/g, ' ');
  }

  function answersMatch(topic, value) {
    const n = normalize(value);
    if (!n) return false;
    const accept = [topic.question.answer].concat(topic.question.accept || []);
    return accept.some(a => normalize(a) === n);
  }

  function shuffle(arr) {
    const a = arr.slice();
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
  }

  function formatTime(totalSec) {
    totalSec = Math.max(0, Math.floor(totalSec));
    const m = Math.floor(totalSec / 60);
    const s = totalSec % 60;
    return String(m).padStart(2, '0') + ':' + String(s).padStart(2, '0');
  }

  function currentUnit() {
    return unitsData[String(state.unitId)];
  }

  function renderUnitSelect() {
    const grid = $('#unitGrid');
    grid.innerHTML = '';
    [1, 2, 3, 4].forEach(id => {
      const u = unitsData[String(id)];
      const card = document.createElement('article');
      card.className = 'card';
      card.innerHTML = `
        <span class="badge">Unit ${id} · ${u.examWeight} AP Exam</span>
        <h2>${u.title}</h2>
        <p>${u.blurb}</p>
        <p><strong>${u.topics.length}</strong> topics · ${u.periods}</p>
        <button type="button" class="btn btn-primary" data-unit="${id}">Open Unit ${id}</button>`;
      grid.appendChild(card);
    });
    grid.querySelectorAll('[data-unit]').forEach(btn => {
      btn.addEventListener('click', () => openSetup(Number(btn.getAttribute('data-unit')));
    });
  }

  function openSetup(unitId) {
    state.unitId = unitId;
    const u = currentUnit();
    $('#setupTitle').textContent = `Unit ${unitId}: ${u.title}`;
    $('#setupBlurb').textContent = `${u.topics.length} fill-in-the-blank items (1 per CED topic). ${u.blurb}`;
    $('#headerSubtitle').textContent = `Unit ${unitId} · ${u.title}`;
    showScreen('screen-setup');
  }

  function buildWordBank(unit) {
    const corrects = unit.topics.map(t => t.question.answer);
    let distractors = [];
    unit.topics.forEach(t => { distractors = distractors.concat(t.question.distractors || []); });
    distractors = shuffle(Array.from(new Set(distractors.map(d => String(d))))).filter(d =>
      !corrects.some(c => normalize(c) === normalize(d))
    ).slice(0, Math.min(8, Math.ceil(unit.topics.length / 4)));
    return shuffle(corrects.concat(distractors));
  }

  function renderAssessment() {
    const unit = currentUnit();
    state.answers = {};
    state.selectedChip = null;
    state.activeBlank = null;
    $('#selectedTermLabel').textContent = 'none';
    $('#assessTitle').textContent = `Unit ${unit.id} Diagnostic — ${unit.title}`;
    const bank = $('#wordBank');
    bank.innerHTML = '';
    buildWordBank(unit).forEach((term, idx) => {
      const chip = document.createElement('button');
      chip.type = 'button';
      chip.className = 'chip';
      chip.textContent = term;
      chip.setAttribute('draggable', 'true');
      chip.setAttribute('role', 'option');
      chip.dataset.term = term;
      chip.id = 'chip-' + idx;
      chip.addEventListener('dragstart', e => {
        e.dataTransfer.setData('text/plain', term);
        e.dataTransfer.effectAllowed = 'copy';
      });
      chip.addEventListener('click', () => {
        $$('.chip').forEach(c => c.classList.remove('selected'));
        if (state.activeBlank) {
          fillBlank(state.activeBlank, term);
          state.activeBlank = null;
          $$('.blank').forEach(b => b.classList.remove('active'));
          return;
        }
        chip.classList.add('selected');
        state.selectedChip = term;
        $('#selectedTermLabel').textContent = term;
      });
      bank.appendChild(chip);
    });

    const list = $('#questionList');
    list.innerHTML = '';
    unit.topics.forEach((t, i) => {
      const parts = String(t.question.stem).split('__________');
      const wrap = document.createElement('article');
      wrap.className = 'q';
      wrap.dataset.topicId = t.id;
      const blankId = 'blank-' + t.id.replace('.', '-');
      wrap.innerHTML = `
        <div class="q-head">
          <span class="q-id">${t.id} · ${t.title}</span>
          <span class="lo">${t.lo}</span>
        </div>
        <div class="stem"></div>
        <div class="sources"><strong>Required source focus:</strong> ${(t.sources && t.sources[0]) ? t.sources[0] : 'CED required sources'}</div>
        <details class="hint"><summary>Hint</summary><div>${t.hint}</div></details>`;
      const stem = wrap.querySelector('.stem');
      stem.appendChild(document.createTextNode(parts[0] || ''));
      const blank = document.createElement('span');
      blank.className = 'blank';
      blank.id = blankId;
      blank.tabIndex = 0;
      blank.setAttribute('role', 'button');
      blank.setAttribute('aria-label', 'Answer blank for topic ' + t.id);
      blank.dataset.topicId = t.id;
      blank.textContent = '____';
      blank.addEventListener('dragover', e => { e.preventDefault(); });
      blank.addEventListener('drop', e => {
        e.preventDefault();
        fillBlank(blank, e.dataTransfer.getData('text/plain'));
      });
      blank.addEventListener('click', () => {
        if (state.selectedChip) {
          fillBlank(blank, state.selectedChip);
          state.selectedChip = null;
          $('#selectedTermLabel').textContent = 'none';
          $$('.chip').forEach(c => c.classList.remove('selected'));
          return;
        }
        $$('.blank').forEach(b => b.classList.remove('active'));
        blank.classList.add('active');
        state.activeBlank = blank;
        toast('Blank selected — tap a word-bank term');
      });
      blank.addEventListener('keydown', e => {
        if (e.key === 'Backspace' || e.key === 'Delete') {
          clearBlank(blank);
        }
      });
      stem.appendChild(blank);
      stem.appendChild(document.createTextNode(parts[1] || ''));
      list.appendChild(wrap);
    });
    showScreen('screen-assess');
  }

  function fillBlank(blank, term) {
    if (!term) return;
    blank.textContent = term;
    blank.classList.add('filled');
    blank.classList.remove('active');
    state.answers[blank.dataset.topicId] = term;
    refreshChipUsedState();
  }

  function clearBlank(blank) {
    blank.textContent = '____';
    blank.classList.remove('filled');
    delete state.answers[blank.dataset.topicId];
    refreshChipUsedState();
  }

  function refreshChipUsedState() {
    const used = new Set(Object.values(state.answers).map(normalize));
    $$('.chip').forEach(chip => {
      chip.classList.toggle('used', used.has(normalize(chip.dataset.term)));
    });
  }

  function startTimer() {
    stopTimer();
    const chip = $('#timerChip');
    if (!state.timer.enabled) {
      chip.style.display = 'none';
      return;
    }
    chip.style.display = 'inline-flex';
    chip.classList.remove('warn', 'critical');
    state.timer.startedAt = Date.now();
    state.timer.elapsedSec = 0;
    state.timer.countdownRemain = state.timer.durationSec;
    const tick = () => {
      state.timer.elapsedSec = Math.floor((Date.now() - state.timer.startedAt) / 1000);
      let display = state.timer.elapsedSec;
      if (state.timer.mode === 'down') {
        state.timer.countdownRemain = Math.max(0, state.timer.durationSec - state.timer.elapsedSec);
        display = state.timer.countdownRemain;
        chip.classList.toggle('warn', display <= 120 && display > 0);
        chip.classList.toggle('critical', display === 0);
        if (display === 0) toast('Time is up — you may still submit.');
      }
      $('#timerDisplay').textContent = formatTime(display);
    };
    tick();
    state.timer.interval = setInterval(tick, 250);
  }

  function stopTimer() {
    if (state.timer.interval) {
      clearInterval(state.timer.interval);
      state.timer.interval = null;
    }
    if (state.timer.enabled && state.timer.startedAt) {
      state.timer.elapsedSec = Math.floor((Date.now() - state.timer.startedAt) / 1000);
    }
  }

  function submitDiagnostic() {
    const unit = currentUnit();
    const unanswered = unit.topics.filter(t => !state.answers[t.id]).length;
    if (unanswered > 0) {
      const ok = confirm(`${unanswered} blank(s) still empty. Submit anyway? Empty answers count as incorrect.`);
      if (!ok) return;
    }
    stopTimer();
    const detail = unit.topics.map(t => {
      const given = state.answers[t.id] || '';
      const correct = answersMatch(t, given);
      return { topic: t, given, correct };
    });
    const correctCount = detail.filter(d => d.correct).length;
    const pct = Math.round((correctCount / unit.topics.length) * 100);
    state.results = {
      unitId: unit.id,
      correctCount,
      total: unit.topics.length,
      pct,
      elapsedSec: state.timer.enabled ? state.timer.elapsedSec : state.timer.elapsedSec,
      timed: state.timer.enabled,
      detail,
      missed: detail.filter(d => !d.correct)
    };
    state.reteachDone = {};
    renderReport();
  }

  function renderReport() {
    const r = state.results;
    const unit = unitsData[String(r.unitId)];
    $('#reportUnitLine').textContent = `Unit ${unit.id}: ${unit.title}`;
    $('#scoreHero').innerHTML = `
      <div class="stat gold"><div class="label">Score</div><div class="value">${r.pct}%</div></div>
      <div class="stat"><div class="label">Correct</div><div class="value">${r.correctCount}/${r.total}</div></div>
      <div class="stat"><div class="label">Elapsed time</div><div class="value">${r.timed || r.elapsedSec ? formatTime(r.elapsedSec) : '—'}</div></div>
      <div class="stat"><div class="label">Missed topics</div><div class="value">${r.missed.length}</div></div>`;
    const list = $('#topicResults');
    list.innerHTML = '';
    r.detail.forEach(d => {
      const row = document.createElement('div');
      row.className = 'topic-row ' + (d.correct ? 'ok-row' : 'missed');
      row.innerHTML = `
        <strong>${d.topic.id} ${d.topic.title}</strong> — ${d.correct ? 'Correct' : 'Needs reteach'}<br/>
        <span class="lo">${d.topic.lo}</span><br/>
        Your answer: <em>${d.given || '(blank)'}</em>${d.correct ? '' : ` · Expected: <strong>${d.topic.question.answer}</strong>`}`;
      list.appendChild(row);
    });
    $('#btnReteach').hidden = r.missed.length === 0;
    $('#printAnswerKey').hidden = false;
    $('#printAnswerKey').innerHTML = `<h3>Answer Key Summary</h3>` + r.detail.map(d =>
      `<div class="topic-row"><strong>${d.topic.id}</strong>: ${d.topic.question.answer}</div>`
    ).join('');
    showScreen('screen-report');
  }

  function renderReteach() {
    const r = state.results;
    const host = $('#reteachList');
    host.innerHTML = '';
    if (!r.missed.length) {
      host.innerHTML = '<p>No missed topics — excellent work.</p>';
      showScreen('screen-reteach');
      return;
    }
    r.missed.forEach((d, idx) => {
      const t = d.topic;
      const sim = t.simulation;
      const card = document.createElement('article');
      card.className = 'panel missed';
      card.innerHTML = `
        <h3>${t.id} · ${t.title}</h3>
        <p class="lo">${t.lo}</p>
        <h4>Essential Knowledge</h4>
        <ul>${(t.ek || []).map(e => `<li>${e}</li>`).join('')}</ul>
        <h4>Required Sources</h4>
        <ul>${(t.sources || []).map(s => `<li>${s}</li>`).join('')}</ul>
        <div class="sim" data-sim-idx="${idx}">
          <strong>Mini-simulation (${sim.type})</strong>
          <p>${sim.prompt}</p>
          <div class="sim-options"></div>
          <button type="button" class="btn btn-primary check-sim">Check</button>
          <div class="feedback" hidden></div>
        </div>
        <div class="actions"><button type="button" class="btn btn-secondary dark mark-done">Mark reteach complete</button></div>`;
      const optWrap = card.querySelector('.sim-options');
      (sim.options || []).forEach((opt, oi) => {
        const id = `sim-${t.id.replace('.', '-')}-${oi}`;
        const lab = document.createElement('label');
        lab.innerHTML = `<input type="radio" name="sim-${t.id}" value="${opt.replace(/"/g, '&quot;')}" /> ${opt}`;
        optWrap.appendChild(lab);
      });
      card.querySelector('.check-sim').addEventListener('click', () => {
        const chosen = card.querySelector(`input[name="sim-${t.id}"]:checked`);
        const fb = card.querySelector('.feedback');
        fb.hidden = false;
        if (!chosen) {
          fb.className = 'feedback bad';
          fb.textContent = 'Select an option first.';
          return;
        }
        const ok = normalize(chosen.value) === normalize(sim.correct);
        fb.className = 'feedback ' + (ok ? 'good' : 'bad');
        fb.textContent = (ok ? 'Correct. ' : 'Not quite. ') + sim.feedback;
      });
      card.querySelector('.mark-done').addEventListener('click', () => {
        state.reteachDone[t.id] = true;
        toast(`Reteach marked complete: ${t.id}`);
      });
      host.appendChild(card);
    });
    showScreen('screen-reteach');
  }

  function applyUrlParams() {
    const params = new URLSearchParams(location.search);
    const unit = Number(params.get('unit'));
    if (unit >= 1 && unit <= 4 && unitsData[String(unit)]) {
      openSetup(unit);
      if (params.get('timer') === '1') {
        $('#timerEnabled').checked = true;
        $('#timerOptions').hidden = false;
        const mode = params.get('mode') === 'down' ? 'down' : 'up';
        $('#timerMode').value = mode;
        $('#countdownFields').hidden = mode !== 'down';
        const mins = Number(params.get('minutes'));
        if (mins > 0) {
          $('#customMinutes').value = String(mins);
          state.timer.durationSec = mins * 60;
        } else {
          state.timer.durationSec = 30 * 60;
        }
      }
      return true;
    }
    return false;
  }

  function wire() {
    renderUnitSelect();
    $('#timerEnabled').addEventListener('change', e => {
      $('#timerOptions').hidden = !e.target.checked;
    });
    $('#timerMode').addEventListener('change', e => {
      $('#countdownFields').hidden = e.target.value !== 'down';
    });
    $$('#countdownFields [data-mins]').forEach(btn => {
      btn.addEventListener('click', () => {
        $('#customMinutes').value = btn.getAttribute('data-mins');
      });
    });
    $('#btnBackSelect').addEventListener('click', () => {
      showScreen('screen-select');
      $('#headerSubtitle').textContent = 'Unit Diagnostic Study Aid';
      history.replaceState({}, '', location.pathname);
    });
    $('#btnHome').addEventListener('click', () => {
      stopTimer();
      $('#timerChip').style.display = 'none';
      showScreen('screen-select');
      $('#headerSubtitle').textContent = 'Unit Diagnostic Study Aid';
    });
    $('#btnStart').addEventListener('click', () => {
      state.timer.enabled = $('#timerEnabled').checked;
      state.timer.mode = $('#timerMode').value;
      if (state.timer.mode === 'down') {
        const mins = Number($('#customMinutes').value) || 20;
        state.timer.durationSec = Math.max(1, mins) * 60;
      } else {
        state.timer.durationSec = 0;
      }
      renderAssessment();
      startTimer();
    });
    $('#btnCancelAssess').addEventListener('click', () => {
      stopTimer();
      $('#timerChip').style.display = 'none';
      openSetup(state.unitId);
    });
    $('#btnSubmit').addEventListener('click', submitDiagnostic);
    $('#btnPrint').addEventListener('click', () => window.print());
    $('#btnPrintFromReteach').addEventListener('click', () => {
      showScreen('screen-report');
      setTimeout(() => window.print(), 50);
    });
    $('#btnReteach').addEventListener('click', renderReteach);
    $('#btnBackReport').addEventListener('click', () => showScreen('screen-report'));
    $('#btnRetake').addEventListener('click', () => openSetup(state.results.unitId));
    $('#btnNewUnit').addEventListener('click', () => {
      showScreen('screen-select');
      $('#headerSubtitle').textContent = 'Unit Diagnostic Study Aid';
    });
    if (!applyUrlParams()) showScreen('screen-select');
  }

  document.addEventListener('DOMContentLoaded', wire);
})();
</script>
</body>
</html>
'@

$outPath = Join-Path $PSScriptRoot 'index.html'
Set-Content -Path $outPath -Value ($htmlHead + $jsonSafe + $htmlTail) -Encoding UTF8
Write-Host "Wrote $outPath ($((Get-Item $outPath).Length) bytes)"

