# Vakantiekompas PWA

Mobiele webapp voor gewicht, omtrek, training en voeding. De app werkt offline, gebruikt e-mailinlog en synchroniseert via Supabase.

## 1. Supabase instellen

1. Maak een gratis project op Supabase.
2. Open **SQL Editor** en voer `supabase-setup.sql` uit.
3. Kopieer onder **Project Settings → API** de Project URL en publishable/anon key.
4. Vul beide waarden in `config.js` in. De publishable/anon key mag in de frontend staan; de database wordt beschermd door de RLS-regels uit het SQL-bestand.

## 2. E-mailinlog instellen

Stel onder **Authentication → URL Configuration** de uiteindelijke GitHub Pages-URL in als Site URL en voeg dezelfde URL toe aan Redirect URLs.

## 3. Publiceren

Plaats de inhoud van deze map in een GitHub-repository en activeer onder **Settings → Pages** GitHub Actions als bron. De app kan daarna in Safari of Chrome aan het beginscherm worden toegevoegd.

## 4. Bestaande gegevens meenemen

Exporteer in de lokale versie via **Instellingen → Gegevens exporteren** een back-up. Log in op de online app en importeer daar hetzelfde JSON-bestand. De geïmporteerde gegevens worden vervolgens automatisch gesynchroniseerd.
