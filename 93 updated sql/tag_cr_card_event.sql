WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Mcc_Code  AS  STRING)  AS  Mcc_Code,
	SAFE_CAST(Mrch_Nbr  AS  STRING)  AS  Mrch_Nbr,
	SAFE_CAST(Mrch_Org_Nbr  AS  STRING)  AS  Mrch_Org_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
