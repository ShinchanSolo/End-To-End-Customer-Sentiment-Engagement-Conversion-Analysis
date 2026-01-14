
# 📊 Marketing 360 Analysis – Customer, Social Media & Conversion Analytics

A complete end-to-end marketing analytics project that analyzes customer behavior, social media performance, customer sentiment, and conversion funnels using a modern Bronze–Silver–Gold data architecture, SQL, Python, and Power BI.

This project demonstrates how raw marketing data can be transformed into business-ready insights and actionable recommendations.



## 📌 Table of Contents
- Overview  
- Business Problem & Questions  
- Dataset  
- Tools & Technologies  
- Project Structure  
- Data Architecture (Bronze–Silver–Gold)  
- Data Cleaning & Enrichment  
- Key Analysis & Findings  
- Dashboards  
- How to Run This Project  
- Final Business Recommendations  
- Author & Contact  


---


## Overview

This project provides a **360-degree view of marketing performance** by integrating:

- **Customer journey data**  
- **Social media engagement data** (Views, Clicks, Likes)  
- **Customer review data** (Ratings & Sentiment)  

The objective is to identify **conversion bottlenecks**, **engagement inefficiencies**, and **customer satisfaction gaps**, enabling **data-driven business decisions**.


---
## Business Problem & Questions

### Business Challenges
- High marketing visibility but **low conversion efficiency**
- Significant **customer drop-off before purchase**
- Mixed **customer sentiment** affecting product performance
- Lack of a **unified analytics view** across marketing channels


---
### Business Questions
- Where do customers drop off in the conversion funnel?
- How effective is social media engagement in driving growth?
- What is the overall customer sentiment and rating trend?
- Which products perform best and worst across engagement and conversion?
- Are there seasonal or demographic patterns influencing conversions?

## Dataset

The project uses structured datasets related to:

- Customer Reviews
Ratings, review text, sentiment category, review dates

- Social Media Performance
Views, clicks, likes by product and month

- Customer Journey / Conversion Data
View, click, drop-off, and purchase actions

- Product & Customer Attributes
Product name, country, city, gender

## Tools & Technologies

- SQL – Data modeling, transformations, Data cleaning and EDA

- Python – Data enrichment & processing
(Pandas, sentiment enrichment using vader lexicon)

- Power BI – Interactive dashboards & DAX

- Git & GitHub – Version control

- VS Code – Development environment

## Project Structure

```
MARKETING_360_ANALYSIS/
│
├── data/                         # Raw and intermediate datasets
│
├── scripts/
│   ├── bronze/
│   │   ├── create_db.sql
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── load_silver.sql
│   │
│   ├── gold/
│   │   └── gold.sql
│   │
│   └── customer_review_enrichment.py
│
├── venv/                         # Virtual environment
├── requirement.txt               # Python dependencies
└── README.md
```

---

---

## Data Architecture (Bronze–Silver–Gold)

### 🥉 Bronze Layer
- Raw ingestion of source data  
- Minimal transformations  
- Preserves original structure for traceability  

### 🥈 Silver Layer
- Cleaned and standardized data  
- Type casting and null handling  
- Deduplication and enrichment  

### 🥇 Gold Layer
- Business-ready views  
- Star-schema-like dimensions and facts  
- Optimized for analytics and reporting  

---

## Data Cleaning & Enrichment

- Removed invalid and duplicate records  
- Standardized date and numeric formats  
- Handled missing values  

### Python-Based Enrichment
- Sentiment classification  
- Text normalization  

### Analytical Views Created
- Conversion metrics  
- Engagement metrics  
- Rating and sentiment trends  

---

## Key Analysis & Findings

### Conversion Analysis
- Overall conversion rate: **9.57%**
- Largest drop-off occurs between **Click → Likes**
- Conversion performance varies significantly by product and month

### Social Media Analysis
- Over **9M views**, but comparatively low clicks
- Engagement declines over time → **content fatigue**
- Certain products drive high visibility but low interaction

### Customer Reviews & Sentiment
- Average rating: **3.69**, indicating moderate satisfaction
- Positive sentiment dominates, but negative and mixed reviews are significant
- Repeated complaints around **pricing**

---

## Dashboards

### Power BI Dashboards Include:

#### Overview Dashboard
- Conversion rate  
- Engagement KPIs  
- Average ratings  

#### Customer Reviews Dashboard
- Rating distribution  
- Sentiment analysis  
- Monthly rating trends  

#### Social Media Dashboard
- Views, clicks, likes trends  
- Product-level engagement  

#### Conversion Dashboard
- Funnel analysis  
- Conversion by product, month, and gender  

---

## How to Run This Project

1. Clone the repository  
2. Create and activate a virtual environment  
3. Install dependencies:
4. Run SQL scripts in order:
create_db.sql
Bronze → Silver → Gold scripts
, run python customer_review_enrichment.py
5.Open the Power BI dashboard and refresh data


## Final Business Recommendations

- Optimize checkout flow to reduce click-to-purchase drop-offs

- Reallocate marketing spend toward high-converting products

- Refresh social media content to counter engagement decay

- Address recurring customer complaints highlighted in reviews

- Use sentiment trends as an early indicator of price to product issues


**Soloman Londhe**  
Aspiring Data Analyst 



📧 Email: solomanlondhe0123@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/saloman-londhe-ba9183344/)