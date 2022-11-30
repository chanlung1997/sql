WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CONSUMER_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Campaign_Event_Id  AS  INT64)  AS  Campaign_Event_Id,
	CAST(CBS_Orig_Chnl  AS  STRING)  AS  CBS_Orig_Chnl,
	CAST(Chnl_Id  AS  STRING)  AS  Chnl_Id,
	CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Event_Actv_Type_Code  AS  STRING)  AS  Event_Actv_Type_Code,
	CAST(Event_Categ_Code  AS  STRING)  AS  Event_Categ_Code,
	CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	CAST(Event_Status_Code  AS  STRING)  AS  Event_Status_Code,
	CAST(Event_Status_Reason_Code  AS  STRING)  AS  Event_Status_Reason_Code,
	CAST(Event_Time  AS  INT64)  AS  Event_Time,
	CAST(Fin_Ind  AS  STRING)  AS  Fin_Ind,
	CAST(Instr_Nbr  AS  STRING)  AS  Instr_Nbr,
	CAST(Ref_Nbr  AS  STRING)  AS  Ref_Nbr,
	CAST(Self_Srv_Ind  AS  STRING)  AS  Self_Srv_Ind,
	CAST(Source_Trx_Ref_Nbr  AS  STRING)  AS  Source_Trx_Ref_Nbr,
	CAST(Third_Party_Ind  AS  STRING)  AS  Third_Party_Ind,
	CAST(Two_FA_Type  AS  STRING)  AS  Two_FA_Type
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
Fin_Ind,
Instr_Nbr,
Ref_Nbr,
Self_Srv_Ind,
Source_Trx_Ref_Nbr,
Third_Party_Ind,
Two_FA_Type,
	{{  aggregate_validation_columns(['__01YN_valid_Fin_Ind','__01YN_valid_Self_Srv_Ind','__01YN_valid_Third_Party_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
