WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_bill_pmt_mrch_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Mrch_Id  AS  STRING)  AS  Mrch_Id,
	SAFE_CAST(Mrch_Name  AS  STRING)  AS  Mrch_Name,
	SAFE_CAST(Mrch_Categ  AS  STRING)  AS  Mrch_Categ
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
