# Yanke Li — personal academic website

Live at **https://14110951d0.github.io**, served by GitHub Pages from the `main`
branch of `14110951D0/14110951D0.github.io`. Every push to `main` redeploys
within about a minute.

The deployed page is a single self-contained `index.html`: the Source Serif 4
fonts and the portrait are embedded as base64 data URIs, so it makes no
external requests. `YankeLi_CV.pdf` sits next to it and is linked from the CV
buttons.

## Files

| File | Purpose |
|---|---|
| `_template.html` | **Edit this.** The page with `{{FONT_NORMAL}}`, `{{FONT_ITALIC}}` and `{{PHOTO_SRC}}` placeholders instead of base64 blobs |
| `build.sh` | Embeds the assets into the template and writes `index.html` |
| `index.html` | Generated output — the deployed page. Don't edit by hand |
| `YankeLi_CV.pdf` | CV linked from the site — overwrite with each new version |
| `assets/photo.jpg` | 640×800 web crop of the portrait |
| `assets/fonts/` | Source Serif 4, latin subset (SIL Open Font License 1.1) |

## Updating the site

```bash
./build.sh
git add -A && git commit -m "Update site" && git push
```

`build.sh` needs only `bash` and `perl` (both ship with Git for Windows). To
update just the CV, overwrite `YankeLi_CV.pdf` and commit; no rebuild needed.
