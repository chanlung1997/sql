WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_campaign_response_history_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Batch_Dte  AS  DATE)  AS  Batch_Dte,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Party_Type  AS  STRING)  AS  Party_Type,
	SAFE_CAST(Campaign_Id  AS  STRING)  AS  Campaign_Id,
	SAFE_CAST(Version_Id  AS  INT64)  AS  Version_Id,
	SAFE_CAST(Selection_Dte  AS  DATE)  AS  Selection_Dte,
	SAFE_CAST(Cell_Id  AS  INT64)  AS  Cell_Id,
	SAFE_CAST(Step_Id  AS  INT64)  AS  Step_Id,
	SAFE_CAST(This_step_Dte  AS  DATE)  AS  This_step_Dte,
	SAFE_CAST(Campaign_Class  AS  STRING)  AS  Campaign_Class,
	SAFE_CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	SAFE_CAST(Response_Dte  AS  DATE)  AS  Response_Dte,
	SAFE_CAST(Response_Time  AS  INT64)  AS  Response_Time,
	SAFE_CAST(Response_Code  AS  STRING)  AS  Response_Code,
	SAFE_CAST(Call_Back_Dte  AS  DATE)  AS  Call_Back_Dte,
	SAFE_CAST(Complaint_Code  AS  STRING)  AS  Complaint_Code,
	SAFE_CAST(Complaint_Txt  AS  STRING)  AS  Complaint_Txt,
	SAFE_CAST(More_Info_Code  AS  STRING)  AS  More_Info_Code,
	SAFE_CAST(More_Info_Txt  AS  STRING)  AS  More_Info_Txt,
	SAFE_CAST(Retry_Count  AS  STRING)  AS  Retry_Count,
	SAFE_CAST(User_Data_Code  AS  STRING)  AS  User_Data_Code,
	SAFE_CAST(User_Data_Txt  AS  STRING)  AS  User_Data_Txt,
	SAFE_CAST(Agent_Id  AS  STRING)  AS  Agent_Id,
	SAFE_CAST(Call_Back_Time  AS  STRING)  AS  Call_Back_Time,
	SAFE_CAST(Call_Back_Phone  AS  STRING)  AS  Call_Back_Phone,
	SAFE_CAST(Cim_Call_Back_Dte  AS  DATE)  AS  Cim_Call_Back_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
