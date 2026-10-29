# Yanke Li — personal academic website

Live at **https://14110951d0.github.io**, served by GitHub Pages from the `main`
branch of `14110951D0/14110951D0.github.io`. Every push to `main` redeploys
within about a minute.

The deployed page is `index.html`: the Source Serif 4 fonts and the portrait are
embedded as base64 data URIs; research figures are separate PNGs under
`assets/research/`, loaded lazily. `YankeLi_CV.pdf` sits next to it and is
linked from the CV buttons.

## Files

| File | Purpose |
|---|---|
| `_template.html` | **Edit this.** The page with `{{FONT_NORMAL}}`, `{{FONT_ITALIC}}` and `{{PHOTO_SRC}}` placeholders instead of base64 blobs |
| `build.sh` | Embeds the fonts and portrait into the template and writes `index.html` |
| `index.html` | Generated output — the deployed page. Don't edit by hand |
| `YankeLi_CV.pdf` | CV linked from the site — built from the `14110951D0/YankeLi_CV` repo (XeLaTeX) |
| `assets/photo.jpg` | 640×800 web crop of the portrait |
| `assets/fonts/` | Source Serif 4, latin subset (SIL Open Font License 1.1) |
| `assets/research/` | Research figures cut from the PhD defense slides (10 Sep 2026): `<study>-method.png` is the card figure (the slide's METHOD column), `<study>-panel.png` the full Problem · Method · Results panel shown in the pop-up |

## Research section

- **Map** (`figure.rmap`): two views of the thesis — along the patient journey
  and by method — switched with CSS-only radio buttons; every study links to
  its card.
- **Project cards** (`.proj-groups`): grouped by thesis part (I Snapshot,
  II Signal, III Action). Colours come from the `--part1/2/3` tokens, which
  follow the defense deck's palette.
- **Pop-up**: clicking a card figure opens its full panel in a `<dialog>`
  (small script at the end of the page); without JavaScript the link simply
  opens the PNG. Each figure link carries `data-caption`, `data-alt` (a text
  description of the whole panel) and `data-w`/`data-h` (the panel PNG's
  pixel size, so the dialog keeps its shape while the image loads) — update
  all four when a panel is re-cut. On phones the panel can be panned sideways.

The figures were made by rendering each project slide at 1.5× in headless
Edge, measuring the three slide columns in the browser, and cropping below the
slide header — so no collaborator photos or logos are included.

## Updating the site

```bash
./build.sh
git add -A && git commit -m "Update site" && git push
```

`build.sh` needs only `bash` and `perl` (both ship with Git for Windows). To
update just the CV, overwrite `YankeLi_CV.pdf` and commit; no rebuild needed.
