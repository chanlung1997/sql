WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.LN_COLLAT_PPTY_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Appl_nbr  AS  STRING)  AS  Appl_nbr,
	CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	CAST(Appl_Ppsl_Seq_Nbr  AS  NUMERIC)  AS  Appl_Ppsl_Seq_Nbr,
	CAST(Collat_Seq_Nbr  AS  NUMERIC)  AS  Collat_Seq_Nbr,
	CAST(Collat_Categ_Code  AS  STRING)  AS  Collat_Categ_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
