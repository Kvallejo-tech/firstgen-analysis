# First-Generation Student Achievement Gap Dashboard

An interactive data dashboard exploring how family background shapes college access, academic performance, graduation outcomes, and what support programs can do to close the gap.

Built as a summer research project at Ramapo College of New Jersey.

---

## Project Overview

First-generation college students — those whose parents never earned a four-year degree — face compounding barriers that the system was not built to address. This dashboard tells that story in data across seven charts, moving from root causes to real-world solutions.

**The narrative arc:**
1. **Income & Access** — Lower family income directly reduces the likelihood of continuing to college
2. **Race & First-Gen Status** — Hispanic/Latino and Black students are disproportionately first-generation
3. **Score Analysis** — Parental education level correlates with academic test performance
4. **Graduation Outcomes** — First-gen students graduate at less than half the rate of continuing-gen peers
5. **Debt & Income** — First-gen students carry more debt and earn significantly less after graduation
6. **EOF Program (3.0 GPA)** — EOF students outpace non-EOF peers in academic achievement over time
7. **Support Programs Close the Gap** — EOF and TRIO programs nearly eliminate the graduation rate gap

---

## Data Sources

| File | Description | Source |
|------|-------------|--------|
| `StudentsPerformance.csv` | Student test scores (math, reading, writing) by parental education level | Kaggle — Students Performance in Exams |
| `firstgen_race.csv` | Percentage of first-generation students by race/ethnicity | FirstGen Forward 2024 |
| `firstgen_debt.csv` | Average student debt, loan rates, and post-graduation income by generation | FirstGen Forward 2024 |
| `income_college_continuation.csv` | College continuation rates by family income quartile | U.S. Census Bureau 1974–2022, compiled by The Pell Institute — *Indicators of Higher Education Equity in the United States 2024* |
| `eof_gpa.csv` | EOF vs. non-EOF student GPA attainment over time (2017–2022) | NJ EOF Progress Report 2023 |
| `program_impact.csv` | Graduation rates by student category and support program | FirstGen Forward 2024 · U.S. Dept of Education 2019 · NJ EOF Progress Report 2023 |

---

## Tech Stack

- **D3.js v7** — all chart rendering
- **DuckDB-WASM** — in-browser SQL queries against CSV files
- **Vanilla HTML/CSS/JS** — no build tools or frameworks required

---

## How to Run

Because the dashboard loads CSV files via `fetch()`, it needs to be served over HTTP — opening the HTML file directly in a browser will not work.

### Option 1 — Python (recommended, no install needed)

```bash
cd ~/Downloads
python3 -m http.server 8080
```

Then open your browser and go to:

```
http://localhost:8080/firstgen_dashboard.html
```

### Option 2 — Node.js

```bash
npx serve ~/Downloads
```

Then open the URL shown in the terminal.

### Option 3 — Share publicly

To share with others, drag and drop the following files onto [netlify.com/drop](https://netlify.com/drop):

- `firstgen_dashboard.html`
- `StudentsPerformance.csv`
- `firstgen_race.csv`
- `firstgen_debt.csv`
- `income_college_continuation.csv`
- `eof_gpa.csv`
- `program_impact.csv`

You'll get a public URL instantly.

---

## File Structure

```
firstgen-analysis/
├── README.md
├── StudentsPerformance.csv
├── firstgen_race.csv
├── firstgen_debt.csv
├── firstgen_debt.csv
├── income_college_continuation.csv
├── eof_gpa.csv
├── program_impact.csv
├── data/
├── output/
├── reports/
├── scripts/
│   └── 01_load_and_clean_data.R
└── visualizations/
```

---

## Author

**Kevin Vallejo**
Ramapo College of New Jersey — Summer 2026
