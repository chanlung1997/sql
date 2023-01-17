WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_occup_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Occup_Code  AS  STRING)  AS  Occup_Code,
	SAFE_CAST(Occup_Desc  AS  STRING)  AS  Occup_Desc
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_OccupCode('Occup_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Occup_Code,
	Occup_Desc,
	{{  full_valid_flag(['__OccupCode_valid_Occup_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
