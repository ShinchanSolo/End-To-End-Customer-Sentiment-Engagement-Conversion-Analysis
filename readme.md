
# 📊 End To End Customer Sentiment, Engagement & Conversion Analysis

A complete end-to-end marketing analytics project that analyzes customer behavior, social media performance, customer sentiment, and conversion funnels using a modern Bronze–Silver–Gold data architecture, SQL, Python, and Power BI.

This project demonstrates how raw marketing data can be transformed into business-ready insights and actionable recommendations.



## 📌 Table of Contents
- Overview  
- Business Problems 
- Dataset
- Key Analysis & Findings 
- Business Recommendations 
- Tools & Technologies    
- Data Architecture (Bronze–Silver–Gold)  
- Data Cleaning & Enrichment    
- Author & Contact  


---


## Overview

This project provides a **360-degree view of marketing performance** by integrating:

- **Customer journey data**  
- **Social media engagement data** (Views, Clicks, Likes)  
- **Customer review data** (Ratings and Sentiment)  

The objective is to identify **conversion bottlenecks**, **engagement inefficiencies**, and **customer satisfaction gaps**, enabling **data-driven business decisions**.


---
## Business Problem
![alt text](<dashboard_images\image_5.png>)

![alt text](<dashboard_images\image_6.png>)

![alt text](<dashboard_images\image_7.png>)

---
## Key Analysis & Findings 

![alt text](<dashboard_images\image_8.png>)

![alt text](<dashboard_images\image_9.png>)

![alt text](<dashboard_images\image_10.png>)

![alt text](<dashboard_images\image_11.png>)



---
## Business Recommendations

![alt text](<dashboard_images\image_12.png>)



---
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




## How to Run This Project

1. Clone the repository  
2. Create and activate a virtual environment  
3. Install dependencies:
4. Run SQL scripts in order:
create_db.sql
Bronze → Silver → Gold scripts
, run python customer_review_enrichment.py
5.Open the Power BI dashboard and refresh data

---

---

**Soloman Londhe**  
Aspiring Data Analyst 



📧 Email: solomanlondhe0123@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/saloman-londhe-ba9183344/)