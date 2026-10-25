-- Olist E-Commerce Customer Lifecycle & RFM Segmentation Engine
-- Target Platform: PostgreSQL

WITH customer_orders AS (
    SELECT 
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp,
        p.payment_value
    FROM olist_customers c
    JOIN olist_orders o ON c.customer_id = o.customer_id
    JOIN olist_order_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
),

customer_metrics AS (
    SELECT 
        customer_unique_id,
        EXTRACT(DAY FROM ('2018-09-04 00:00:00'::timestamp - MAX(order_purchase_timestamp))) AS recency,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(payment_value) AS monetary
    FROM customer_orders
    GROUP BY customer_unique_id
),

rfm_scores AS (
    SELECT 
        customer_unique_id,
        recency,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score, 
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score, 
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score   
    FROM customer_metrics
)

SELECT 
    customer_unique_id,
    recency,
    frequency,
    monetary,
    (r_score * 100 + f_score * 10 + m_score) AS rfm_combined_score,
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions / Best Customers'
        WHEN r_score >= 3 AND f_score >= 1 AND m_score >= 3 THEN 'Loyal Customers / Big Spenders'
        WHEN r_score >= 4 AND f_score = 1 THEN 'New Customers'
        WHEN r_score <= 2 AND r_score > 0 AND f_score >= 3 THEN 'Can''t Lose Them / At Risk'
        WHEN r_score <= 2 THEN 'Hibernating / Churned'
        ELSE 'About to Sleep / General'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;
