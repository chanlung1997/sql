WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_ln_ppsl_collat_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Appl_nbr  AS  STRING)  AS  Appl_nbr,
	SAFE_CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	SAFE_CAST(Appl_Ppsl_Seq_Nbr  AS  NUMERIC)  AS  Appl_Ppsl_Seq_Nbr,
	SAFE_CAST(Collat_Seq_Nbr  AS  NUMERIC)  AS  Collat_Seq_Nbr,
	SAFE_CAST(Collat_Categ_Code  AS  STRING)  AS  Collat_Categ_Code,
	SAFE_CAST(Collat_Nbr  AS  STRING)  AS  Collat_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
