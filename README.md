# PDF certifikát

Kontrola a převod tiskových PDF do **PDF/X-1a, X-3 a X-4** pro tiskové podmínky FOGRA (výchozí FOGRA39).
Hlídá krytí barvy, rozlišení obrázků, písma, linky, spadávku, čistý formát podle názvu souboru, přímé barvy
a strukturu PDF/X. Vytvoří certifikát tiskové kontroly v češtině a angličtině – volitelně ověřený
v Adobe Acrobat Pro a elektronicky podepsaný.

© 2026 Prose on Pixels s.r.o.

---

## Požadavky

- Mac s procesorem **Apple Silicon** (M1 až M4 a novější)
- **macOS 14** nebo novější
- Volitelně **Adobe Acrobat Pro** – pro závěrečné ověření v Preflightu
- Nic dalšího (Python, Ghostscript ani Homebrew) instalovat nemusíte, vše je v aplikaci

## Instalace

1. Stáhněte **[PDFCertifikat-macOS.zip](https://github.com/Luboshort/pdf-certifikat/releases/download/aplikace/PDFCertifikat-macOS.zip)**
   – vždy nejnovější celá aplikace (asi 160 MB).
   Soubory `PDFCertifikat-update-…` u jednotlivých verzí nestahujte, slouží jen pro automatické aktualizace.
2. Dvojklikem soubor rozbalte – vznikne aplikace **PDF certifikát**.
3. Přetáhněte ji do složky **Aplikace** (Applications).
4. Otevřete **Terminál** (Aplikace › Utility › Terminál), vložte tento příkaz a stiskněte Enter:

   ```
   xattr -dr com.apple.quarantine "/Applications/PDF certifikát.app"
   ```

   Aplikace není podepsaná certifikátem Apple, proto ji macOS bez tohoto kroku nespustí
   („aplikace je poškozená“ nebo „nelze ověřit vývojáře“). Stačí to udělat jednou.
5. Spusťte **PDF certifikát** z Aplikací nebo Launchpadu.

> Pokud macOS přesto spuštění zablokuje: **Nastavení systému › Soukromí a zabezpečení**, dole
> u hlášení o PDF certifikátu klikněte **Přesto otevřít**.

## Aktualizace

Aplikace po každém spuštění sama zkontroluje, zda je k dispozici nová verze. Pokud ano, nabídne ji
s popisem změn – stačí kliknout **Nainstalovat a restartovat**. Aplikace se zavře a za několik sekund
se sama otevře v nové verzi. Nastavení, předvolby a heslo podpisu zůstanou.

Ruční kontrola: menu **PDF certifikát › Zkontrolovat aktualizace…**

## Použití v kostce

1. Nahoře vlevo zvolte **předvolbu** (např. *Default X-1a FOGRA39* nebo *GWG Archový ofset CMYK*).
2. **Přetáhněte PDF** (nebo celou složku) do okna.
3. Po kontrole uvidíte výsledek: **Vyhovuje / Vyhovuje s varováním / Nevyhovuje**, seznam nálezů
   a náhled místa nálezu včetně separací a mapy krytí.
4. Do složky **`<název souboru>_certification`** vedle originálu se uloží výsledné **PDF/X**
   a **certifikát** v jazyce aplikace (česky nebo anglicky podle přepínače CZ | EN).
   Protokol a náhledy jsou k dispozici jen během práce s aplikací.

Jazyk aplikace přepnete v horní liště okna vlevo, vedle názvu aplikace (**CZ | EN**).

## Ověření v Adobe Acrobat Pro (volitelné)

Tlačítko **Ověřit v Acrobatu** spustí kontrolu v Preflightu Acrobatu; výsledek se doplní do certifikátu.
Při prvním použití se macOS zeptá, zda smí PDF certifikát ovládat Acrobat – potvrďte **OK**
(případně Nastavení systému › Soukromí a zabezpečení › Automatizace).

## Elektronický podpis (volitelné)

V nastavení **Elektronický podpis** zapněte *Podepsat výsledek*. Aplikace najde vaše digitální ID
z Acrobatu, zadáte heslo a klikněte *Ověřit heslo*. Heslo lze uložit do Klíčenky macOS.
Při prvním použití (a po aktualizaci) se macOS může zeptat na přístup ke Klíčence – potvrďte
**Vždy povolit**.

## Odinstalace

Přetáhněte **PDF certifikát** z Aplikací do Koše. Nastavení případně odstraníte smazáním složky
`~/Library/Application Support/PDFXCert`.

---

## English

**PDF certifikát** checks and converts print PDFs to PDF/X-1a, X-3 and X-4 (FOGRA39 by default)
and creates a print inspection certificate in Czech and English.

**Requirements:** Apple Silicon Mac, macOS 14 or later; Adobe Acrobat Pro optional.

**Installation:**
1. Download **[PDFCertifikat-macOS.zip](https://github.com/Luboshort/pdf-certifikat/releases/download/aplikace/PDFCertifikat-macOS.zip)**
   – always the latest full app.
2. Unzip it and move **PDF certifikát** to the Applications folder.
3. In Terminal run once:
   `xattr -dr com.apple.quarantine "/Applications/PDF certifikát.app"`
4. Open the app. Switch the language to **EN** in the toolbar at the top left, next to the app name.

**Updates** are offered automatically after launch – click **Install and Relaunch**.
