-- ============================================================
-- U.S. Hospital Characteristics & Quality Analysis
-- Author: Christina Hinds
-- Database: hospital_data
-- Table: hospitals
--
-- Dataset: CMS Hospital General Information
-- Analysis performed using MySQL Workbench
-- ============================================================


-- ============================================================
-- 1. TOTAL NUMBER OF HOSPITALS
-- Question: How many hospitals are represented in the dataset?
-- ============================================================

SELECT
    COUNT(*) AS total_hospitals
FROM hospitals;


-- ============================================================
-- 2. HOSPITALS BY STATE
-- Question: How many hospitals are represented in each state?
-- ============================================================

SELECT
    State,
    COUNT(*) AS number_of_hospitals
FROM hospitals
GROUP BY State
ORDER BY number_of_hospitals DESC;


-- ============================================================
-- 3. HOSPITAL TYPES
-- Question: What are the most common hospital types?
-- ============================================================

SELECT
    `Hospital Type`,
    COUNT(*) AS number_of_hospitals
FROM hospitals
GROUP BY `Hospital Type`
ORDER BY number_of_hospitals DESC;


-- ============================================================
-- 4. HOSPITAL OWNERSHIP
-- Question: What are the most common hospital ownership types?
-- ============================================================

SELECT
    `Hospital Ownership`,
    COUNT(*) AS number_of_hospitals
FROM hospitals
GROUP BY `Hospital Ownership`
ORDER BY number_of_hospitals DESC;


-- ============================================================
-- 5. EMERGENCY SERVICES
-- Question: How many hospitals provide emergency services?
-- ============================================================

SELECT
    COUNT(*) AS number_of_hospitals_with_emergency_services
FROM hospitals
WHERE `Emergency Services` = 'YES';


-- ============================================================
-- 6. EMERGENCY SERVICES PERCENTAGE
-- Question: What percentage of hospitals provide emergency services?
-- ============================================================

SELECT
    COUNT(*) AS emergency_hospitals,
    2917 AS total_hospitals,
    ROUND(COUNT(*) / 2917 * 100, 1) AS percentage
FROM hospitals
WHERE `Emergency Services` = 'YES';


-- ============================================================
-- 7. EMERGENCY SERVICES BY HOSPITAL TYPE
-- Question: Does emergency-service availability vary by hospital type?
-- ============================================================

SELECT
    `Hospital Type`,
    COUNT(*) AS total_hospitals,
    SUM(
        CASE
            WHEN `Emergency Services` = 'YES' THEN 1
            ELSE 0
        END
    ) AS emergency_hospitals,
    ROUND(
        SUM(
            CASE
                WHEN `Emergency Services` = 'YES' THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS percentage_with_emergency_services
FROM hospitals
GROUP BY `Hospital Type`
ORDER BY percentage_with_emergency_services DESC;


-- ============================================================
-- 8. HOSPITAL RATING DISTRIBUTION
-- Question: How are overall hospital ratings distributed?
-- ============================================================

SELECT
    `Hospital overall rating`,
    COUNT(*) AS number_of_hospitals
FROM hospitals
GROUP BY `Hospital overall rating`
ORDER BY `Hospital overall rating` DESC;


-- ============================================================
-- 9. HOSPITAL RATING DISTRIBUTION WITH PERCENTAGES
-- Question: What percentage of hospitals fall into each rating?
-- ============================================================

SELECT
    `Hospital overall rating`,
    COUNT(*) AS number_of_hospitals,
    ROUND(COUNT(*) / 2917 * 100, 1) AS percentage
FROM hospitals
GROUP BY `Hospital overall rating`
ORDER BY `Hospital overall rating` DESC;


-- ============================================================
-- 10. HIGH-RATED HOSPITALS
-- Question: How many hospitals have a 4- or 5-star rating?
-- ============================================================

SELECT
    COUNT(*) AS high_rated_hospitals
FROM hospitals
WHERE `Hospital overall rating` IN (4, 5);


-- ============================================================
-- 11. HIGH-RATED HOSPITAL PERCENTAGE
-- Question: What percentage of hospitals have a 4- or 5-star rating?
-- ============================================================

SELECT
    COUNT(*) AS high_rated_hospitals,
    2917 AS total_hospitals,
    ROUND(COUNT(*) / 2917 * 100, 1) AS percentage
FROM hospitals
WHERE `Hospital overall rating` IN (4, 5);


-- ============================================================
-- 12. AVERAGE HOSPITAL RATING BY STATE
-- Question: What is the average hospital rating in each state?
-- ============================================================

SELECT
    State,
    COUNT(*) AS number_of_hospitals,
    ROUND(AVG(`Hospital overall rating`), 1) AS average_rating
FROM hospitals
GROUP BY State
ORDER BY average_rating DESC;


-- ============================================================
-- 13. STATES WITH AVERAGE RATING OF AT LEAST 3.5
-- Question: Which states have an average rating of 3.5 or higher?
-- ============================================================

SELECT
    State,
    COUNT(*) AS number_of_hospitals,
    ROUND(AVG(`Hospital overall rating`), 1) AS average_rating
FROM hospitals
GROUP BY State
HAVING AVG(`Hospital overall rating`) >= 3.5
ORDER BY average_rating DESC;


-- ============================================================
-- 14. AVERAGE RATING BY STATE
-- Minimum 20 hospitals
--
-- Question:
-- How does average hospital rating vary among states
-- with at least 20 hospitals?
-- ============================================================

SELECT
    State,
    COUNT(*) AS number_of_hospitals,
    ROUND(AVG(`Hospital overall rating`), 1) AS average_rating
FROM hospitals
GROUP BY State
HAVING COUNT(*) >= 20
ORDER BY average_rating DESC;


-- ============================================================
-- 15. AVERAGE RATING BY HOSPITAL OWNERSHIP
-- Question: What is the average hospital rating by ownership type?
-- ============================================================

SELECT
    `Hospital Ownership`,
    COUNT(*) AS number_of_hospitals,
    ROUND(AVG(`Hospital overall rating`), 1) AS average_rating
FROM hospitals
GROUP BY `Hospital Ownership`
ORDER BY average_rating DESC;


-- ============================================================
-- 16. AVERAGE RATING BY OWNERSHIP
-- Minimum 50 hospitals
--
-- Question:
-- How does average rating vary among ownership categories
-- with at least 50 hospitals?
-- ============================================================

SELECT
    `Hospital Ownership`,
    COUNT(*) AS number_of_hospitals,
    ROUND(AVG(`Hospital overall rating`), 1) AS average_rating
FROM hospitals
GROUP BY `Hospital Ownership`
HAVING COUNT(*) >= 50
ORDER BY average_rating DESC;


-- ============================================================
-- 17. 4-5 STAR HOSPITALS BY STATE
-- Question:
-- How many 4-5 star hospitals are represented in each state?
-- ============================================================

SELECT
    State,
    COUNT(*) AS total_hospitals,
    SUM(
        CASE
            WHEN `Hospital overall rating` IN (4, 5) THEN 1
            ELSE 0
        END
    ) AS high_rated_hospitals
FROM hospitals
GROUP BY State
ORDER BY high_rated_hospitals DESC;


-- ============================================================
-- 18. PERCENTAGE OF 4-5 STAR HOSPITALS BY STATE
-- Question:
-- What percentage of hospitals in each state have a 4-5 star rating?
-- ============================================================

SELECT
    State,
    COUNT(*) AS total_hospitals,
    SUM(
        CASE
            WHEN `Hospital overall rating` IN (4, 5) THEN 1
            ELSE 0
        END
    ) AS high_rated_hospitals,
    ROUND(
        SUM(
            CASE
                WHEN `Hospital overall rating` IN (4, 5) THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS percentage_high_rated
FROM hospitals
GROUP BY State
ORDER BY percentage_high_rated DESC;


-- ============================================================
-- 19. PERCENTAGE OF 4-5 STAR HOSPITALS BY STATE
-- Minimum 20 hospitals
--
-- Question:
-- Among states with at least 20 hospitals, what percentage
-- have a 4-5 star rating?
-- ============================================================

SELECT
    State,
    COUNT(*) AS total_hospitals,
    SUM(
        CASE
            WHEN `Hospital overall rating` IN (4, 5) THEN 1
            ELSE 0
        END
    ) AS high_rated_hospitals,
    ROUND(
        SUM(
            CASE
                WHEN `Hospital overall rating` IN (4, 5) THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS percentage_high_rated
FROM hospitals
GROUP BY State
HAVING COUNT(*) >= 20
ORDER BY percentage_high_rated DESC;


-- ============================================================
-- 20. TOP 10 STATES BY NUMBER OF HOSPITALS
-- Question: Which 10 states have the most hospitals?
-- ============================================================

SELECT
    State,
    COUNT(*) AS number_of_hospitals
FROM hospitals
GROUP BY State
ORDER BY number_of_hospitals DESC
LIMIT 10;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================