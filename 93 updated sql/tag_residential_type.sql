WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_residential_type_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Residential_Type_Code  AS  STRING)  AS  Residential_Type_Code,
	SAFE_CAST(Residential_Type_Desc  AS  STRING)  AS  Residential_Type_Desc
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
