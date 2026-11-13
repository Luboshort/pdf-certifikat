#!/bin/bash
# Instalace aplikace PDF certifikát jedním příkazem:
#   curl -fsSL https://raw.githubusercontent.com/Luboshort/pdf-certifikat/main/install.sh | bash
# Stáhne nejnovější celou aplikaci, nainstaluje ji do Aplikací (když tam nejsou práva, tak do
# Aplikací uživatele ~/Applications), zruší karanténu a spustí ji. Cíl lze vnutit: PDFCERT_DEST=~/Applications
set -euo pipefail
URL="https://github.com/Luboshort/pdf-certifikat/releases/download/aplikace/PDFCertifikat-macOS.zip"
APPNAME="PDF certifikát.app"

echo "PDF certifikát – instalace"
if [ "$(uname -m)" != "arm64" ]; then
  echo "CHYBA: aplikace je jen pro Mac s procesorem Apple Silicon (M1 a novější)."; exit 1
fi
MAJOR=$(sw_vers -productVersion | cut -d. -f1)
if [ "$MAJOR" -lt 14 ]; then
  echo "CHYBA: je potřeba macOS 14 nebo novější (tento Mac má $(sw_vers -productVersion))."; exit 1
fi

if [ -n "${PDFCERT_DEST:-}" ]; then
  DEST="$PDFCERT_DEST"
elif [ -w /Applications ]; then
  DEST="/Applications"
else
  DEST="$HOME/Applications"
fi
mkdir -p "$DEST"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "› Stahuji aplikaci (asi 160 MB)…"
curl -fL --progress-bar -o "$TMP/app.zip" "$URL"
echo "› Rozbaluji…"
ditto -x -k "$TMP/app.zip" "$TMP/x"
SRC="$(find "$TMP/x" -maxdepth 2 -name "*.app" -type d | head -1)"
if [ -z "$SRC" ]; then echo "CHYBA: v balíčku není aplikace."; exit 1; fi

# běžící aplikaci ukončit, starou verzi nahradit
osascript -e 'tell application id "cz.pdfcertifikat.app" to quit' >/dev/null 2>&1 || true
sleep 1
echo "› Instaluji do $DEST…"
rm -rf "$DEST/$APPNAME"
ditto "$SRC" "$DEST/$APPNAME"
xattr -dr com.apple.quarantine "$DEST/$APPNAME" 2>/dev/null || true
touch "$DEST/$APPNAME"

VER=$(defaults read "$DEST/$APPNAME/Contents/Info" CFBundleShortVersionString 2>/dev/null || echo "?")
echo "Hotovo: PDF certifikát $VER v $DEST"
echo "Další aktualizace aplikace nabídne sama po spuštění."
open "$DEST/$APPNAME"
