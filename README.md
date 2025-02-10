# Riyadh-Hotels
Hotel Booking Data Analysis & Power BI Dashboard

## Project Overview
This project focuses on analyzing and cleaning hotel booking data in Riyadh using SQL Server. The dataset contains various inconsistencies, including NULL values, incorrect data types, and duplicates, which needed to be addressed for accurate insights.

## Key Steps

#### Data Cleaning

 • Replaced NULL values with default values to avoid analytical inconsistencies.<br>
 • Used placeholder values (e.g., -1 for missing numeric data, 1900-01-01 for missing dates).
 
#### Data Transformation

 • Converted data types for better accuracy (e.g., price and base_price to DECIMAL, rating to FLOAT).
 • Removed old columns and replaced them with the correct formats.

#### Table Restructuring

 • Reordered columns for logical grouping.
 • Renamed fields to align with best practices in database management.

#### Data Analysis & Insights

 • Identified top-rated hotels and their pricing strategies.
 • Analyzed how prices vary across booking platforms.
 • Explored seasonal trends in hotel bookings.

#### Power BI Dashboard Development

 • Created an interactive dashboard that visualizes key insights:
 • Hotel ratings and their pricing trends
 • Peak booking seasons
 • Revenue by booking source
 • Correlation between ratings and prices

 ### SQL Queries Used

 • Data Cleaning Queries (Handling NULLs, modifying data types).
 • Data Transformation Queries (Converting and renaming columns).
 • Exploratory Data Analysis Queries (Hotel rankings, pricing trends, booking patterns).

🔍 Key Findings

 • Pricing variations exist among different booking platforms.
 • Hotels with higher ratings tend to have higher average prices.
 • Seasonal demand impacts hotel pricing significantly.

### Technologies Used

 • SQL Server for data cleaning and analysis.
 • T-SQL Queries for transformation and insights extraction.
 • Power BI for interactive dashboard visualization.
 
