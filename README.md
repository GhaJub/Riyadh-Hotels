# Riyadh-Hotels
Hotel Booking Data Analysis & Power BI Dashboard

## Project Overview
This project focuses on analyzing and cleaning hotel booking data in Riyadh using SQL Server. <br>
The dataset contains various inconsistencies, including NULL values, incorrect data types, and duplicates, which needed to be addressed for accurate insights.

## Key Steps

#### Data Cleaning

 • Replaced NULL values with default values to avoid analytical inconsistencies.<br>
 • Used placeholder values (e.g., -1 for missing numeric data, 1900-01-01 for missing dates).
 
#### Data Transformation

 • Converted data types for better accuracy (e.g., price and base_price to DECIMAL, rating to FLOAT).<br>
 • Removed old columns and replaced them with the correct formats.

#### Table Restructuring

 • Reordered columns for logical grouping.<br>
 • Renamed fields to align with best practices in database management.

#### Data Analysis & Insights

 • Identified top-rated hotels and their pricing strategies.<br>
 • Analyzed how prices vary across booking platforms.<br>
 • Explored seasonal trends in hotel bookings.<br>

#### Power BI Dashboard 

 • Created an interactive dashboard that visualizes key insights:<br>
 • Hotel ratings and their pricing trends<br>
 • Peak booking seasons<br>
 • Revenue by booking source
 

 ### SQL Queries Used

 • Data Cleaning Queries (Handling NULLs, modifying data types).<br>
 • Data Transformation Queries (Converting and renaming columns).<br>
 • Exploratory Data Analysis Queries (Hotel rankings, pricing trends, booking patterns).

🔍 Key Findings

 • Pricing variations exist among different booking platforms.<br>
 • Hotels with higher ratings tend to have higher average prices.<br>
 • Seasonal demand impacts hotel pricing significantly.

### Technologies Used

 • SQL Server for data cleaning and analysis.<br>
 • T-SQL Queries for transformation and insights extraction.<br>
 • Power BI for interactive dashboard visualization.
 
