WITH CTE_1 AS (
SELECT 
    *
FROM gcp-prj-dat-bigquery-env-00.bqd_015_raw.ACCT_CARD_raw
),

CTE_2 AS (
SELECT 
    CAST(acct_nbr AS INT64) AS acct_nbr,
    CAST(appl_id AS STRING) AS appl_id,
    CAST(control_fields AS STRING) AS control_fields,
    CAST(limit_type_code AS STRING) AS limit_type_code,
    CAST(update_dte AS DATE) AS update_dte,
    CAST(limit_amt AS NUMERIC) AS limit_amt
FROM CTE_1
),

CTE_3 AS (
SELECT 
    *,
    {{ validate_NoFutureDate('update_dte') }} 
FROM CTE_2
),

CTE_4 AS (
SELECT 
acct_nbr,
appl_id,
control_fields,
limit_type_code,
update_dte,
limit_amt,
    {{ aggregate_validation_columns(['__NoFutureDate_update_dte']) }}
FROM CTE_3
)

SELECT * FROM CTE_4