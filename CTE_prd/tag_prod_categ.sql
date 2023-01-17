WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_prod_categ_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Prod_Categ_Code  AS  STRING)  AS  Prod_Categ_Code,
	SAFE_CAST(Prod_Categ_Desc  AS  STRING)  AS  Prod_Categ_Desc,
	SAFE_CAST(Prod_Subtype_Code  AS  STRING)  AS  Prod_Subtype_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
