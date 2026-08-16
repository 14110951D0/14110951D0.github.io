# Yanke Li — personal academic website

A single-file, self-contained static site (`index.html`): the Source Serif 4 fonts
and the portrait photo are embedded as data URIs, so there are no external
requests and no build step. `YankeLi_CV.pdf` sits next to it and is linked from
the CV buttons.

## Files

| File | Purpose |
|---|---|
| `index.html` | The website (self-contained; deploy this) |
| `YankeLi_CV.pdf` | CV linked from the site — replace with each new CV version |
| `_template.html` | Editable source: same page with `{{FONT_NORMAL}}`, `{{FONT_ITALIC}}`, `{{PHOTO_SRC}}` placeholders instead of base64 blobs. Edit this, then re-inject the assets (any text replace works) |
| `assets/photo.jpg` | The 640×800 web crop of the portrait |

## Deploy to GitHub Pages

1. Create a repository named `<username>.github.io` on GitHub
   (for the user `14110951D0` that is `14110951D0.github.io`).
2. Put `index.html` and `YankeLi_CV.pdf` in the repository root and push.
3. In the repository: Settings → Pages → Source: “Deploy from a branch”,
   branch `main`, folder `/ (root)`.
4. The site appears at `https://<username>.github.io` within a minute or two.

Any other static host (Netlify, Cloudflare Pages, university web space) works
the same way — upload the two files.

## Updating content

Edit the text directly in `index.html` (the content is at the bottom, below the
embedded font data), or edit `_template.html` and re-inject the assets. To update
the CV, just overwrite `YankeLi_CV.pdf`.
