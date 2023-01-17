WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_octopus_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Octopus_Card_Nbr  AS  STRING)  AS  Octopus_Card_Nbr,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(Appl_Dte  AS  DATE)  AS  Appl_Dte,
	SAFE_CAST(End_Dte  AS  DATE)  AS  End_Dte,
	SAFE_CAST(Holder_Id  AS  STRING)  AS  Holder_Id,
	SAFE_CAST(Holder_Name  AS  STRING)  AS  Holder_Name,
	SAFE_CAST(Octopus_Card_Status_Code  AS  STRING)  AS  Octopus_Card_Status_Code,
	SAFE_CAST(Octopus_Card_Status_Dte  AS  DATE)  AS  Octopus_Card_Status_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Start_Dte')}},
	{{validate_NoFutureDate('Appl_Dte')}},
	{{validate_NoFutureDate('Octopus_Card_Status_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Octopus_Card_Nbr,
	Start_Dte,
	Appl_Dte,
	End_Dte,
	Holder_Id,
	Holder_Name,
	Octopus_Card_Status_Code,
	Octopus_Card_Status_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Start_Dte','__NoFutureDate_valid_Appl_Dte','__NoFutureDate_valid_Octopus_Card_Status_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
