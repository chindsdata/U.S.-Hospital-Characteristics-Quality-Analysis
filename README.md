# U.S. Hospital Characteristics & Quality Analysis

## Project Overview

This project analyzes hospital characteristics, services, ownership, and overall ratings using U.S. hospital data. SQL was used to explore and analyze the dataset, while Microsoft Excel was used to organize results and create visualizations.

The goal of this project was to practice healthcare data analysis, SQL querying, descriptive statistics, and data visualization while identifying patterns within the hospital dataset.

---

## Tools Used

- MySQL Workbench
- Microsoft Excel
- GitHub

---

## Dataset

**CMS Hospital General Information**

This project uses a downloaded version of the CMS Hospital General Information dataset. The specific file analyzed for this project contained **2,917 hospital records**.

The CMS dataset includes information such as hospital location, hospital type, ownership, emergency services, and overall hospital rating.

Source: [CMS Hospital General Information](https://data.cms.gov/provider-data/dataset/xubh-q36u)

---

## Business Questions

This project explored the following questions:

1. How many hospitals are represented in the dataset?
2. How are hospitals distributed across states?
3. What are the most common hospital types?
4. What are the most common hospital ownership categories?
5. How many hospitals provide emergency services?
6. What percentage of hospitals provide emergency services?
7. Does emergency-service availability vary by hospital type?
8. How are overall hospital ratings distributed?
9. What percentage of hospitals have 4–5 star ratings?
10. How does average hospital rating vary by state?
11. How does average hospital rating vary by hospital ownership?
12. How does the percentage of 4–5 star hospitals vary by state?

---

## Methodology

SQL was used to perform descriptive analysis of the hospital dataset. Queries included:

- `COUNT()` for hospital counts
- `AVG()` for average ratings
- `SUM()` and `CASE WHEN` for conditional counts
- `GROUP BY` for category-level comparisons
- `WHERE` for filtering individual records
- `HAVING` for filtering aggregated groups
- `ORDER BY` for ranking results
- Percentage calculations for comparative analysis

For state-level rating comparisons, states with fewer than **20 hospitals** were excluded to reduce the influence of very small groups.

For hospital ownership comparisons, ownership categories with fewer than **50 hospitals** were excluded for the same reason.

---

## Key Findings

### Hospital Representation

The dataset contains **2,917 hospitals** across the United States.

California had the largest number of hospitals represented in the analyzed file with 269, followed by Texas with 202 and Florida with 162.
### Emergency Services

A total of **2,777 hospitals**, or approximately **95.2%**, reported providing emergency services.

Emergency-service availability was above 94% across each of the three hospital types represented in the analysis.

---

### Hospital Ratings

Three-star hospitals represented the largest rating category, accounting for **31.1%** of hospitals in the dataset.

Four-star hospitals represented **29.9%**, while five-star hospitals represented **12.1%**.

Overall, **1,225 hospitals (42.0%)** had a 4–5 star overall rating.

### Ratings by State

Among states with at least 20 hospitals represented in the dataset, Utah had the highest average overall hospital rating at **4.3 stars**.

Average ratings varied across states, with differences in both hospital counts and average ratings.

### Ratings by Ownership

Average hospital ratings varied across ownership categories. Ownership categories with at least 50 hospitals were included in this comparison.

The Veterans Health Administration had an average rating of **4.1 stars** across 104 hospitals in the dataset.

---

## Visualizations

The Excel workbook contains visualizations examining:

1. Percentage of 4–5 Star Hospitals by State
2. Distribution of Hospital Overall Ratings
3. Average Hospital Rating by Hospital Ownership
4. Percentage of Hospitals Providing Emergency Services by Hospital Type
5. Top 10 States by Number of Hospitals
6. Average Hospital Rating by State

---

## Data Limitations

- The analysis represents the hospital records contained in the downloaded dataset and may not represent all hospitals currently operating in the United States.
- Hospital counts vary substantially by state and ownership category.
- Minimum sample-size thresholds were applied to some comparisons to reduce the influence of very small groups.
- The analysis is descriptive and does not establish causal relationships between hospital characteristics and ratings.
- Hospital ratings and other data elements may change as CMS updates its datasets.

---

## Project Files

### SQL

The SQL analysis is available in:

`sql/us_hospital_analysis.sql`

### Excel Analysis

The Excel workbook containing the analysis tables and visualizations is available in:

`excel/US_Hospital_Data_Analysis.xlsx`

---

## Skills Demonstrated

- SQL data analysis
- Data cleaning and validation
- Aggregation and grouping
- Conditional logic using `CASE`
- Descriptive statistics
- Percentage calculations
- Healthcare data analysis
- Data visualization
- Excel
- GitHub documentation
