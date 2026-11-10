# E-Commerce Analytics Dashboard

<p align="center">
  <a href="https://app.powerbi.com/view?r=eyJrIjoiNGQzYmQxOTctMjYxMS00MzUzLTlhZDItMzBmMmUyZDg5MjFlIiwidCI6IjE5ZTdkNDNmLWRiOTItNDFmOC04ZDZhLTZhZGY1ZGU2YjhjMCIsImMiOjEwfQ%3D%3D">
    <img src="https://img.shields.io/badge/VIEW_LIVE_DASHBOARD-Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="View Live Dashboard" height="56">
  </a>
</p>


> **Note:** the dataset is sample (synthetic) data. The goal of this project is to show **how to design visuals and what kind of insights a dashboard can deliver**, not to draw real business conclusions.



## Data Pipeline

<img width="1314" height="471" alt="image" src="https://github.com/user-attachments/assets/4b964917-b9c6-4f75-8d25-520147958f40" />


| Stage | What was done |
|---|---|
| Raw data | Source data stored in **SQL Server** |
| EDA | Explored the data to understand its structure, quality and distributions **(e.g. nulls, duplicates, outliers, inconsistent code formatting)** |
| Transformation | Cleaned and modeled the data with **dbt**, then loaded the results back into **SQL Server** |
| Visualization | Connected **Power BI** to the clean tables in SQL Server to build the dashboard |


## Data Dictionary

### Derived columns

```
Discount Amount = Gross Revenue × Discount %
Net Revenue     = Gross Revenue − Discount Amount
```

### Financial metrics

| Metric | Formula | Note |
|---|---|---|
| Net Revenue | Gross Revenue − Discount Amount | Revenue actually collected; the main "Revenue" across the dashboard |
| %Discount | Discount Amount ÷ Gross Revenue | Weighted by totals, not an average of rows |
| %Profit | Profit ÷ Net Revenue | Net Revenue is the denominator because Profit is already after discount |

### Customer metrics

| Metric | Definition |
|---|---|
| New Customers | Customers making their first purchase |
| Returning Customers | Customers who purchased before and came back |
| Retained Customers | Customers who bought last month and again this month |
| Retention Rate | Share of last month's customers who stayed |


---

## Overview Page — Global Marketplace Health & Growth Drivers

![Overview Page](image/overview%20page.jpg)

> **Core Objective:** Executive summary: *Are we growing profitably across international markets, and what operational levers drove our global revenue shifts?*

| Chart & Focus | What the Numbers Show | Key Insight (Presentation Takeaway) | Recommended Action |
|---|---|---|---|
| **Executive KPIs** <br>*(Header Summary)* | **Revenue:** $1.9M (+23.6%)<br>**Profit:** $279.9K (-12.2%)<br>**Margin:** 15.0% (down 6.1%) | **Revenue is up, but profit is down:** Global order volume expanded, but net earnings dropped. Global fulfillment and cross-border shipping costs are eating into our margins. | Pause aggressive international ad spend; audit cross-border carrier rates and stop blanket global discounting. |
| **Sales by Month** <br>*(Monthly Trend)* | **Peaks:** Jun, Nov–Dec<br>**Low:** Jul (sharp dip) across categories | **Category seasonality variations:** Demand peaks during mid-year and year-end shopping seasons, but patterns vary across categories. Daily essentials (Body, Face, Hair Care) maintain steadier demand, while discretionary lines (Make up, Home & Accessories) fluctuate more heavily with seasonal promotions. | Plan inventory and promotional calendars around category-specific buying cycles rather than applying a one-size-fits-all schedule. |
| **Revenue Bridge** <br>*(Waterfall Chart)* | **Volume:** +$366.0K<br>**Price/Mix:** -$5.8K<br>**Discount:** -$3.0K | **Volume drove global expansion:** Sales grew purely from selling more units worldwide. Platform discounts had almost zero impact (-$3.0K), so discounting did **not** cause the profit drop. | **Keep promotional campaigns active** (they drive volume). Look into cross-border logistics and product COGS instead $\rightarrow$ *head to Product Page*. |
| **Pareto Breakdown** <br>*(Top Countries)* | **Top 4 Countries:** ~ 40% of sales *(US alone is 19.6%)* | **High country concentration:** About 40% of marketplace revenue relies on just 4 countries (US, France, Australia, Mexico). High exposure to local customs or shipping shocks. | Secure key shipping lanes and localized warehouse hubs for Top 5 countries; develop regional backup fulfillment routes. |
| **YoY Net Growth** <br>*(Growth by Country)* | **US:** +$61.8K<br>**France:** +$37.6K<br>**UK:** +$31.6K | **Top cross-border growth engines:** Pinpoints the exact national markets generating the highest incremental revenue. | Prioritize localized marketing budgets and overseas warehouse replenishment into these high-growth destinations. |

---

## Product Page — Portfolio Margins & Cross-Border Pricing

![Product Page](image/Product%20page.jpg)

> **Core Objective:** Category breakdown: *Find out which categories fund global operations, manage shipping/discount ceilings, and cut products losing money on cross-border fulfillment.*

| Chart & Focus | What the Numbers Show | Key Insight (Presentation Takeaway) | Recommended Action |
|---|---|---|---|
| **Category Profit Share** <br>*(Donut Chart)* | **Body Care:** 54.3% ($152K) of profit<br>**Face Care:** only 5.8% ($16.3K) | **Heavy profit reliance on one category:** Body Care funds over half of total marketplace profit, likely due to favorable weight-to-shipping-cost ratios and steady repeat demand. | Protect Body Care margins at all costs (never discount deeply); bundle lighter, low-margin items (Face Care) with Body Care to boost order value. |
| **Margin Trend by Year** <br>*(Line Chart)* | **2023 Drop:** All 5 categories lost margin together *(Face Care: 26% $\rightarrow$ 16%)* | **Global freight and logistics shock:** When all categories lose margin simultaneously, the root cause is macro cost inflation (soaring international freight rates/overseas warehousing), not product mispricing. | Renegotiate global 3PL shipping contracts and container freight rates; do not blame individual category managers. |
| **Subcategory Matrix** <br>*(Breakdown Table)* | **Brushes:** Highest discount (18.4%), but lowest profit margin (9.9%) | **Heavy discounts kill cross-border margins:** Deep discounts on lower-ticket items (Brushes) don't trigger enough volume elasticity to offset international handling and shipping costs. | Enforce a strict discount cap; bundle accessories with core cosmetics rather than selling them with standalone discounts. |
| **Product Scatter Plot** <br>*(Revenue vs. Margin)* | Red cluster of items with negative profit *(margins down to -200%)* | **Cross-border money losers:** Several low-price or bulky items cost more to ship, package, and return internationally than they generate in revenue. | Stop international ad spend immediately; restrict cross-border shipping on these items or sell them exclusively via local in-country fulfillment. |

---

## Customer Page — Global Retention & VIP Win-Back

![Customer Page](image/customer%20page.jpg)

> **Core Objective:** Customer health: *Fix cross-border customer churn, identify unprofitable international accounts, and win back high-value global buyers.*

| Chart & Focus | What the Numbers Show | Key Insight (Presentation Takeaway) | Recommended Action |
|---|---|---|---|
| **Customer Retention** <br>*(Monthly Combo Chart)* | **New:** 260–520 buyers/month<br>**Retention:** low at 1.5%–4.8% | **The Global "Leaky Bucket":** International customer acquisition (global paid ads) is working, but post-purchase churn is high due to long shipping times or import friction. | Shift 30% of global acquisition ad spend into localized delivery tracking, faster shipping lanes, and post-purchase onboarding emails. |
| **Customer Segments** <br>*(Segment Breakdown)* | **Frequent Buyers:** ~35% of buyers, but generate **over 50% of revenue** | **Core cross-border buyers carry the platform:** A dedicated core of frequent cross-border shoppers drives over half of sales, while casual buyers add support overhead with minimal profit. | Launch a global VIP membership program (e.g., free cross-border express shipping thresholds) to lock in Frequent Buyer loyalty. |
| **Revenue vs. Profit** <br>*(Customer Scatter Plot)* | A few accounts generate high revenue ($2K–$3K) but negative profit (-$2K) | **Unprofitable large accounts:** Certain international resellers or high-volume buyers generate negative profit due to excessive discount exploitation, customs fees, or high cross-border return rates. | Tighten B2B/reseller commercial terms: enforce Minimum Order Quantities (MOQ), cap custom discounts, and apply international return fees. |
| **Win-Back Table** <br>*(Customer Detail Table)* | **VIPs (e.g. Katelyn G.):** $6.8K sales, $2.4K profit (35.5% margin), only 7% discount | **High-value cross-border buyers gone quiet:** Inactive buyers with multiple regional purchases (`No. Region Purchased`), high willingness-to-pay, and zero discount dependency. | Have VIP account reps reach out with personalized service, priority delivery status, and tailored product recommendations — **without offering discounts**. |


## Project Structure
```text
ecommerce-analysis/
├── ecommerce_project/            # dbt project: transforms raw data into analysis-ready tables
│   ├── models/                   # Transformation models (bronze → silver → gold)
│   │   ├── bronze/               # Raw data from SQL Server with minimal changes
│   │   ├── silver/               # Cleaned, standardized and joined data
│   │   └── gold/                 # Business-ready tables consumed by Power BI
│   │
│   ├── macros/                   # Reusable Jinja/SQL functions
│   ├── seeds/                    # Static reference data (CSV)
│   ├── snapshots/                # Track historical changes of records
│   ├── tests/                    # Custom data quality tests
│   ├── logs/                     # dbt run logs (auto-generated)
│   ├── target/                   # Compiled SQL and run artifacts (auto-generated)
│   └── dbt_project.yml           # dbt project configuration
│
├── notebooks/                    # EDA notebooks to explore the raw data and analytical notebooks
├── logs/                         # Log files from scripts
├── image/                        # Dashboard screenshots used in this README
├── requirements.txt              # Python dependencies
├── .env                          # Database credentials (not committed to Git)
├── .gitignore                    # Files and folders excluded from Git
└── README.md                     # Project documentation
```
---
