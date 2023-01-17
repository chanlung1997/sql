WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cim_wrk_campaign_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Batch_Dte  AS  DATE)  AS  Batch_Dte,
	SAFE_CAST(Campaign_Id  AS  STRING)  AS  Campaign_Id,
	SAFE_CAST(Campaign_Desc  AS  STRING)  AS  Campaign_Desc,
	SAFE_CAST(Campaign_Objective  AS  STRING)  AS  Campaign_Objective,
	SAFE_CAST(Campaign_Start_Dte  AS  DATE)  AS  Campaign_Start_Dte,
	SAFE_CAST(Campaign_End_Dte  AS  DATE)  AS  Campaign_End_Dte,
	SAFE_CAST(Global_Exclude_Check_Ind  AS  STRING)  AS  Global_Exclude_Check_Ind,
	SAFE_CAST(No_Acct_Check_Ind  AS  STRING)  AS  No_Acct_Check_Ind,
	SAFE_CAST(Optout_Check_Ind  AS  STRING)  AS  Optout_Check_Ind,
	SAFE_CAST(Prod_Type_Code  AS  STRING)  AS  Prod_Type_Code,
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Recency_Check_Ind  AS  STRING)  AS  Recency_Check_Ind,
	SAFE_CAST(Record_Sts  AS  STRING)  AS  Record_Sts,
	SAFE_CAST(Update_By  AS  STRING)  AS  Update_By,
	SAFE_CAST(Update_Dte  AS  DATE)  AS  Update_Dte,
	SAFE_CAST(Update_Time  AS  INT64)  AS  Update_Time
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
	Campaign_Id,
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
	Record_Sts,
	Update_By,
	Update_Dte,
	Update_Time,
	{{  full_valid_flag(['__NoFutureDate_valid_Batch_Dte','__NoFutureDate_valid_Campaign_Start_Dte','__01YN_valid_Global_Exclude_Check_Ind','__01YN_valid_No_Acct_Check_Ind','__01YN_valid_Optout_Check_Ind','__01YN_valid_Recency_Check_Ind','__NoFutureDate_valid_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
