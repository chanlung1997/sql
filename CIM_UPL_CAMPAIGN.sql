WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CIM_UPL_CAMPAIGN_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Batch_Dte  AS  DATE)  AS  Batch_Dte,
	CAST(Oper_Code  AS  STRING)  AS  Oper_Code,
	CAST(Campaign_Id  AS  STRING)  AS  Campaign_Id,
	CAST(Update_By  AS  STRING)  AS  Update_By,
	CAST(Campaign_Desc  AS  STRING)  AS  Campaign_Desc,
	CAST(Campaign_Objective  AS  STRING)  AS  Campaign_Objective,
	CAST(Campaign_Start_Dte  AS  DATE)  AS  Campaign_Start_Dte,
	CAST(Campaign_End_Dte  AS  DATE)  AS  Campaign_End_Dte,
	CAST(Global_Exclude_Check_Ind  AS  STRING)  AS  Global_Exclude_Check_Ind,
	CAST(No_Acct_Check_Ind  AS  STRING)  AS  No_Acct_Check_Ind,
	CAST(Optout_Check_Ind  AS  STRING)  AS  Optout_Check_Ind,
	CAST(Prod_Type_Code  AS  STRING)  AS  Prod_Type_Code,
	CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	CAST(Recency_Check_Ind  AS  STRING)  AS  Recency_Check_Ind,
	CAST(Update_Dte  AS  DATE)  AS  Update_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Batch_Dte')}},
	{{validate_NoFutureDate('Campaign_Start_Dte')}},
	{{validate_01YN('Global_Exclude_Check_Ind')}},
	{{validate_01YN('No_Acct_Check_Ind')}},
	{{validate_01YN('Optout_Check_Ind')}},
	{{validate_01YN('Recency_Check_Ind')}},
	{{validate_NoFutureDate('Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Batch_Dte,
Oper_Code,
Campaign_Id,
Update_By,
Campaign_Desc,
Campaign_Objective,
Campaign_Start_Dte,
Campaign_End_Dte,
Global_Exclude_Check_Ind,
No_Acct_Check_Ind,
Optout_Check_Ind,
Prod_Type_Code,
Chnl_Type_Code,
Recency_Check_Ind,
Update_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Batch_Dte','__NoFutureDate_valid_Campaign_Start_Dte','__01YN_valid_Global_Exclude_Check_Ind','__01YN_valid_No_Acct_Check_Ind','__01YN_valid_Optout_Check_Ind','__01YN_valid_Recency_Check_Ind','__NoFutureDate_valid_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
