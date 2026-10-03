#!/usr/bin/env bash
# Rebuild index.html from _template.html, embedding the fonts and portrait
# as base64 data URIs so the deployed page is a single self-contained file.
set -euo pipefail
cd "$(dirname "$0")"

perl -MMIME::Base64 -0777 -pe '
  BEGIN {
    sub b64 { open my $f, "<:raw", $_[0] or die "$_[0]: $!\n"; local $/; encode_base64(scalar <$f>, "") }
    %asset = (
      FONT_NORMAL => b64("assets/fonts/SourceSerif4-normal.woff2"),
      FONT_ITALIC => b64("assets/fonts/SourceSerif4-italic.woff2"),
      PHOTO_SRC   => "data:image/jpeg;base64," . b64("assets/photo.jpg"),
    );
  }
  s/\{\{(FONT_NORMAL|FONT_ITALIC|PHOTO_SRC)\}\}/$asset{$1}/g;
  die "build.sh: unreplaced {{TOKEN}} in template\n" if /\{\{[A-Z_]+\}\}/;
' _template.html > index.html.tmp

mv index.html.tmp index.html
echo "Built index.html ($(wc -c < index.html) bytes)"
