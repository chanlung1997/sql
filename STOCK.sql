WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.STOCK_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(stock_code  AS  STRING)  AS  stock_code,
	CAST(ccy_code  AS  STRING)  AS  ccy_code,
	CAST(stock_name  AS  STRING)  AS  stock_name,
	CAST(stock_type_code  AS  STRING)  AS  stock_type_code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
