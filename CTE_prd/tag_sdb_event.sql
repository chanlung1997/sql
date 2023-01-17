WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_sdb_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Access_Dte  AS  DATE)  AS  Access_Dte,
	SAFE_CAST(Access_Time  AS  INT64)  AS  Access_Time,
	SAFE_CAST(Dest_Acct_Nbr  AS  INT64)  AS  Dest_Acct_Nbr,
	SAFE_CAST(Dest_Appl_Id  AS  STRING)  AS  Dest_Appl_Id,
	SAFE_CAST(Dest_Control_Fields  AS  STRING)  AS  Dest_Control_Fields,
	SAFE_CAST(Function_Code  AS  STRING)  AS  Function_Code,
	SAFE_CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	SAFE_CAST(Rental_Amt  AS  NUMERIC)  AS  Rental_Amt,
	SAFE_CAST(Security_Forfeited  AS  NUMERIC)  AS  Security_Forfeited,
	SAFE_CAST(Security_Recd  AS  NUMERIC)  AS  Security_Recd
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
