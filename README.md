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

Otevřete **Terminál** (Aplikace › Utility › Terminál), vložte tento příkaz a stiskněte Enter:

```
curl -fsSL https://raw.githubusercontent.com/Luboshort/pdf-certifikat/main/install.sh | bash
```

Příkaz stáhne nejnovější celou aplikaci (asi 160 MB), nainstaluje ji a spustí. Instaluje do složky
**Aplikace**; když do ní nemáte práva (např. firemní počítač), tak do **Aplikací uživatele**
(`~/Applications`). Stejným příkazem lze aplikaci kdykoli přeinstalovat.

<details>
<summary>Ruční instalace bez Terminálu (alternativa)</summary>

1. Stáhněte **[PDFCertifikat-macOS.zip](https://github.com/Luboshort/pdf-certifikat/releases/download/aplikace/PDFCertifikat-macOS.zip)**
   (soubory `PDFCertifikat-update-…` u jednotlivých verzí nestahujte, slouží jen pro aktualizace).
2. Rozbalte jej a aplikaci **PDF certifikát** přetáhněte do **Aplikací** nebo **Aplikací uživatele**.
3. V Terminálu jednou zrušte karanténu – podle toho, kam jste aplikaci dali:

   ```
   xattr -dr com.apple.quarantine "/Applications/PDF certifikát.app"
   xattr -dr com.apple.quarantine ~/Applications/"PDF certifikát.app"
   ```

   Aplikace není podepsaná certifikátem Apple; bez tohoto kroku ji macOS nespustí nebo se při prvním
   spuštění dlouho kontroluje (ikona jen skáče v Docku).
4. Spusťte **PDF certifikát**.

</details>

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

**Installation:** open Terminal and run

```
curl -fsSL https://raw.githubusercontent.com/Luboshort/pdf-certifikat/main/install.sh | bash
```

It downloads the latest full app, installs it to Applications (or to `~/Applications` if you have
no rights there) and launches it. Switch the language to **EN** in the toolbar at the top left.

**Updates** are offered automatically after launch – click **Install and Relaunch**.
