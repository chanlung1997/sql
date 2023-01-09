WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cim_response_code_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Campaign_Class  AS  STRING)  AS  Campaign_Class,
	SAFE_CAST(Response_Code  AS  STRING)  AS  Response_Code,
	SAFE_CAST(Response_Desc  AS  STRING)  AS  Response_Desc,
	SAFE_CAST(Response_Status_Code  AS  STRING)  AS  Response_Status_Code,
	SAFE_CAST(Response_Status_Desc  AS  STRING)  AS  Response_Status_Desc
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
