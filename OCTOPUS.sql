WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OCTOPUS_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Octopus_Card_Nbr  AS  STRING)  AS  Octopus_Card_Nbr,
	CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	CAST(Appl_Dte  AS  DATE)  AS  Appl_Dte,
	CAST(End_Dte  AS  DATE)  AS  End_Dte,
	CAST(Holder_Id  AS  STRING)  AS  Holder_Id,
	CAST(Holder_Name  AS  STRING)  AS  Holder_Name,
	CAST(Octopus_Card_Status_Code  AS  STRING)  AS  Octopus_Card_Status_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Start_Dte')}},
	{{validate_NoFutureDate('Appl_Dte')}},
	{{validate_NoFutureDate('Octopus_Card_Status_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Start_Dte,
Appl_Dte,
End_Dte,
Holder_Id,
Holder_Name,
Octopus_Card_Status_Code,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Start_Dte','__NoFutureDate_valid_Appl_Dte','__NoFutureDate_valid_Octopus_Card_Status_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
