WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_education_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Education_Code  AS  STRING)  AS  Education_Code,
	SAFE_CAST(Education_Desc  AS  STRING)  AS  Education_Desc
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
