WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_district_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(District_Code  AS  STRING)  AS  District_Code,
	SAFE_CAST(Area_Code  AS  STRING)  AS  Area_Code,
	SAFE_CAST(District_Desc  AS  STRING)  AS  District_Desc
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
