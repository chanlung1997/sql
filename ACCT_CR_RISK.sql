WITH CTE_1 AS (
SELECT 
    *
FROM gcp-prj-dat-bigquery-env-00.bqd_015_raw.ACCT_CR_RISK_raw
),

CTE_2 AS (
SELECT 
    CAST(Acct_Nbr AS INT64) AS Acct_Nbr,
    CAST(Appl_Id AS STRING) AS Appl_Id,
    CAST(Control_Fields AS STRING) AS Control_Fields,
    CAST(Place_Dte AS DATE) AS Place_Dte,
    CAST(Cr_Risk_Grade_Code AS STRING) AS Cr_Risk_Grade_Code,
    CAST(Ln_Grade_Code AS STRING) AS Ln_Grade_Code
FROM CTE_1
),

CTE_3 AS (
    SELECT 
    *,
    '' AS __full_load_valid
)

SELECT * FROM CTE_3