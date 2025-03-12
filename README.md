# Projekt č.1 - Jiří Kejda

## Úvod
Účelem tohoto projektu je odpovědět na otázky dostupnosti základních potravin široké veřejnosti. Jeho součástí je tvorba datových podkladů, které porovnávají dostupnost potravin na základě průměrných příjmů za určité časové období. Součástí je i tabulka srovnávající HDP, GINI a populaci evropských států.

## Vytvoření primární a sekundární tabulky

### Primární tabulka
- Obsahuje údaje o průměrných platech zaměstnanců v ČR v letech **2000 až 2021** dle různých odvětví.
- Srovnává je s průměrnými cenami potravin v letech **2006 až 2018**.
- Data o cenách potravin zahrnují **27 vybraných položek**.
  - Cena byla zaznamenána jednou týdně pro každou potravinu a v každém regionu ČR.
  - Průměrná cena pro celou ČR je přepočtena na celý rok.
  - Cena pro *Jakostní víno bílé* je uvedena pouze pro roky **2015–2018**.
- Z tabulky platů v ČR byla použita pouze data přepočtených mezd pro statistické výpočty.
  - Přidán slovní popis jednotlivých odvětví.
  - Mzdy byly zprůměrovány dle údajů za každý rok.

### Sekundární tabulka
- Využívá údaje z tabulky `economies` o:
  - HDP
  - Populaci
  - Daňové zátěži
  - Giniho indexu (vyjadřuje rozdělení bohatství ve společnosti)
- Zahrnuje pouze evropské země dle rozdělení z tabulky `countries`.

## Výzkumné otázky

1. **Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
   - Dle výstupu průměrné mzdy v ČR stoupají.
   - Výjimka: rok **2013** (doba recese) s poklesem platů o **0.3 %**.
   - Největší pokles:
     - Obory navázané na finance a nemovitosti v roce **2013**.
     - Rok **2020** s nástupem Covidu a tvrdých opatření.

2. **Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
   - Množství je vyjádřeno pro každý obor zvlášť v letech **2006** a **2018**.
   - Nejméně mléka a chleba: obor *Ubytování, stravování a pohostinství*.
   - Nejvíce:
     - Rok **2006**: obor *Peněžnictví a pojišťovnictví*.
     - Rok **2018**: obor *Informační a komunikační činnosti*.

3. **Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
   - Kategorie *Cukr krystalový*: pokles ceny o **27.2 %** ve sledovaném období.

4. **Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
   - Neexistuje.
   - Nejvyšší rozdíl mezi nárůstem cen potravin a mzdami byl **6 %**.

5. **Má výška HDP vliv na změny ve mzdách a cenách potravin?**
   - Největší nárůst HDP: rok **2006** (**6.8 %**).
   - V následujících dvou letech výrazně rostly ceny a mzdy.
   - Po letech s nižším růstem HDP lze pozorovat nižší růst cen i platů.