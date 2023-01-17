WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_consumer_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Campaign_Event_Id  AS  INT64)  AS  Campaign_Event_Id,
	SAFE_CAST(CBS_Orig_Chnl  AS  STRING)  AS  CBS_Orig_Chnl,
	SAFE_CAST(Chnl_Id  AS  STRING)  AS  Chnl_Id,
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Event_Actv_Type_Code  AS  STRING)  AS  Event_Actv_Type_Code,
	SAFE_CAST(Event_Categ_Code  AS  STRING)  AS  Event_Categ_Code,
	SAFE_CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	SAFE_CAST(Event_Status_Code  AS  STRING)  AS  Event_Status_Code,
	SAFE_CAST(Event_Status_Reason_Code  AS  STRING)  AS  Event_Status_Reason_Code,
	SAFE_CAST(Event_Time  AS  INT64)  AS  Event_Time,
	SAFE_CAST(Fin_Ind  AS  STRING)  AS  Fin_Ind,
	SAFE_CAST(Instr_Nbr  AS  STRING)  AS  Instr_Nbr,
	SAFE_CAST(Ref_Nbr  AS  STRING)  AS  Ref_Nbr,
	SAFE_CAST(Self_Srv_Ind  AS  STRING)  AS  Self_Srv_Ind,
	SAFE_CAST(Source_Trx_Ref_Nbr  AS  STRING)  AS  Source_Trx_Ref_Nbr,
	SAFE_CAST(Third_Party_Ind  AS  STRING)  AS  Third_Party_Ind,
	SAFE_CAST(Two_FA_Type  AS  STRING)  AS  Two_FA_Type,
	SAFE_CAST(User_Id  AS  STRING)  AS  User_Id
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_01YN('Fin_Ind')}},
	{{validate_01YN('Self_Srv_Ind')}},
	{{validate_01YN('Third_Party_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Acct_Nbr,
	Appl_Id,
	Campaign_Event_Id,
	CBS_Orig_Chnl,
	Chnl_Id,
	Chnl_Type_Code,
	Control_Fields,
	Event_Actv_Type_Code,
	Event_Categ_Code,
	Event_Dte,
	Event_Status_Code,
	Event_Status_Reason_Code,
	Event_Time,
	Fin_Ind,
	Instr_Nbr,
	Ref_Nbr,
	Self_Srv_Ind,
	Source_Trx_Ref_Nbr,
	Third_Party_Ind,
	Two_FA_Type,
	User_Id,
	{{  full_valid_flag(['__01YN_valid_Fin_Ind','__01YN_valid_Self_Srv_Ind','__01YN_valid_Third_Party_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
