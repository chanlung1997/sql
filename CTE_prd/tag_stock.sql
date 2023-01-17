WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_stock_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(stock_code  AS  STRING)  AS  stock_code,
	SAFE_CAST(ccy_code  AS  STRING)  AS  ccy_code,
	SAFE_CAST(stock_name  AS  STRING)  AS  stock_name,
	SAFE_CAST(stock_type_code  AS  STRING)  AS  stock_type_code,
	SAFE_CAST(stock_unit_code  AS  STRING)  AS  stock_unit_code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
