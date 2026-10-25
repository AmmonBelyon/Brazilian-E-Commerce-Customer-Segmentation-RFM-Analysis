# Brazilian-E-Commerce-Customer-Segmentation-RFM-Analysis
End-to-end customer segmentation and RFM behavioral analysis on 99k+ Brazilian e-commerce transactions using cloud PostgreSQL and advanced SQL window functions.
# Executive Summary
This project builds an end-to-end cloud data pipeline and business intelligence solution to analyze consumer purchasing behavior for Olist, the largest department store marketplace in Brazil. By implementing a Recency, Frequency, and Monetary (RFM) segmentation engine using advanced SQL, this project extracts actionable customer insights from over 99,000 raw, multi-table marketplace transactions.
# Key Objectives
• Cloud Data Migration: Engineered a browser-to-cloud automated data ingestion pipeline streaming relational datasets into an online warehouse.
• Customer Segmentation: Calculated dynamic customer tiers (e.g., Champions, At Risk, Hibernating) using SQL statistical window functions.
• Business Impact: Identified at-risk revenue segments and targeted retention profiles to combat customer churn.
# Data Architecture and Pipeline
Raw CSV Data ➔Google Colab Ingestion Engine ➔ Neon PostgreSQL Cloud Warehouse ➔ Advanced SQL Engine ➔ Business Segments Output
# Relational Schema Design
Four core data structures were modeled and unified using primary and composite keys:
• olist_customers: Distinct regional tracking using unique buyer hashes.
• olist_orders: Full operational order status lifecycles and timestamp progressions.
• olist_order_items: Micro-transaction pricing allocations and physical inventory itemization.
• olist_order_payments: Transaction payment splits, installment behavior, and gross monetary values.
# Technical Implementations
1. Automated Cloud Ingestion (Python & SQLAlchemy)
   Using a Google Colab orchestration node, a programmatic pipeline reads, validates, and streams structural data chunks straight into the production cloud instances over secure SSL protocols using Pandas network streams.
2. Analytical Segmentation Core Engine (SQL)
   The backbone of this portfolio project is a modular SQL analytical script utilizing multi-layered Common Table Expressions (CTEs) and advanced statistical Window Functions (NTILE).
# Strategic Business Segments Defined
The database dynamically maps individuals into actionable performance classifications:
• Champions / Best Customers: High frequency, recent engagement, top-tier financial spend. Strategy: Reward with loyalty perks and early product drops.
• Loyal Customers / Big Spenders: Consistently high order values across extended periods. Strategy: Upsell premium services or bundles.
• Can't Lose Them / At Risk: High historical value customers who have not made a transaction recently. Strategy: Launch aggressive win-back email or voucher campaigns.
• Hibernating / Churned: Lowest recency and frequency scores. Strategy: Low-priority automated re-engagement to limit active marketing cost


# How to Review This Repository


# Repository Structure

• 📁 /scripts: Contains structured .sql workflow files sequentially labeled from architecture deployment to algorithmic analysis.
• 📁 /notebooks: Houses the Python data orchestration scripts (Olist_Data_Ingestion.ipynb) utilized to manage cloud network transfers.
• 📁 /results: Holds the final exported business insights file (olist_customer_rfm_segments.csv) showcasing the database's output.

# Verification Steps

1. Deploy 01_schema_setup.sql on a PostgreSQL database instance to build the structured data shells.
2. Execute the ingestion notebook to load dataset vectors.
3. Run 02_rfm_analysis.sql to generate the updated consumer segment classifications.


