WITH CTE_1 AS (
SELECT 
    *
FROM gcp-prj-dat-bigquery-env-00.bqd_015_raw.BILL_PMT_MRCH_raw
),

CTE_2 AS (
SELECT 
    CAST(Mrch_Id AS STRING) AS Mrch_Id,
    CAST(Mrch_Name AS STRING) AS Mrch_Name,
    CAST(Mrch_Categ AS STRING) AS Mrch_Categ
FROM CTE_1
),

CTE_3 AS (
SELECT 
    *,
    '' AS __full_load_valid
)

SELECT * FROM CTE_3