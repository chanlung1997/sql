WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.SDB_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Access_Dte  AS  DATE)  AS  Access_Dte,
	CAST(Access_Time  AS  INT64)  AS  Access_Time,
	CAST(Dest_Acct_Nbr  AS  INT64)  AS  Dest_Acct_Nbr,
	CAST(Dest_Appl_Id  AS  STRING)  AS  Dest_Appl_Id,
	CAST(Dest_Control_Fields  AS  STRING)  AS  Dest_Control_Fields,
	CAST(Function_Code  AS  STRING)  AS  Function_Code,
	CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	CAST(Rental_Amt  AS  NUMERIC)  AS  Rental_Amt,
	CAST(Security_Forfeited  AS  NUMERIC)  AS  Security_Forfeited
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
