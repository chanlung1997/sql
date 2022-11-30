WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.RCI_INVEST_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Trx_Linked_Ref  AS  STRING)  AS  Trx_Linked_Ref,
	CAST(Prod_Code  AS  STRING)  AS  Prod_Code,
	CAST(Source_Id  AS  STRING)  AS  Source_Id,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(AP_Ind  AS  STRING)  AS  AP_Ind,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Asset_Concentration_Ind  AS  STRING)  AS  Asset_Concentration_Ind,
	CAST(Asset_Concentration_Reason  AS  STRING)  AS  Asset_Concentration_Reason,
	CAST(Asset_Concentration_Reason_Remark  AS  STRING)  AS  Asset_Concentration_Reason_Remark,
	CAST(Audio_Record_Ind  AS  STRING)  AS  Audio_Record_Ind,
	CAST(Chnl_Id  AS  STRING)  AS  Chnl_Id,
	CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Cust_Objective_Ind  AS  STRING)  AS  Cust_Objective_Ind,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Event_Br_Code  AS  STRING)  AS  Event_Br_Code,
	CAST(Event_Seller_Id  AS  STRING)  AS  Event_Seller_Id,
	CAST(Frequent_Trader_Ind  AS  STRING)  AS  Frequent_Trader_Ind,
	CAST(Frequent_Trader_Reason  AS  STRING)  AS  Frequent_Trader_Reason,
	CAST(Frequent_Trader_Reason_Remark  AS  STRING)  AS  Frequent_Trader_Reason_Remark,
	CAST(Fund_Type_Code  AS  STRING)  AS  Fund_Type_Code,
	CAST(Fund_Type_Desc  AS  STRING)  AS  Fund_Type_Desc,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Objective_Mismatch_Ind  AS  STRING)  AS  Objective_Mismatch_Ind,
	CAST(Objective_Mismatch_Reason  AS  STRING)  AS  Objective_Mismatch_Reason,
	CAST(Objective_Mismatch_Reason_Remark  AS  STRING)  AS  Objective_Mismatch_Reason_Remark,
	CAST(Order_Type_Ind  AS  STRING)  AS  Order_Type_Ind,
	CAST(Prod_Name  AS  STRING)  AS  Prod_Name,
	CAST(Prod_Objective_Ind  AS  STRING)  AS  Prod_Objective_Ind,
	CAST(Prod_Risk_Rating  AS  STRING)  AS  Prod_Risk_Rating,
	CAST(Prod_Tenor  AS  STRING)  AS  Prod_Tenor,
	CAST(Quest_ID  AS  STRING)  AS  Quest_ID,
	CAST(Risk_Disclosure_Ind  AS  STRING)  AS  Risk_Disclosure_Ind,
	CAST(Risk_Mismatch_Ind  AS  STRING)  AS  Risk_Mismatch_Ind,
	CAST(Risk_Mismatch_Reason  AS  STRING)  AS  Risk_Mismatch_Reason,
	CAST(Risk_Mismatch_Reason_Remark  AS  STRING)  AS  Risk_Mismatch_Reason_Remark,
	CAST(Same_Fund_Switch_Ind  AS  STRING)  AS  Same_Fund_Switch_Ind,
	CAST(Same_Fund_Switch_Reason  AS  STRING)  AS  Same_Fund_Switch_Reason,
	CAST(Same_Fund_Switch_Reason_Remark  AS  STRING)  AS  Same_Fund_Switch_Reason_Remark,
	CAST(Short_Hold_Ind  AS  STRING)  AS  Short_Hold_Ind,
	CAST(Short_Hold_Period  AS  STRING)  AS  Short_Hold_Period,
	CAST(Short_Hold_Reason  AS  STRING)  AS  Short_Hold_Reason,
	CAST(Short_Hold_Reason_Remark  AS  STRING)  AS  Short_Hold_Reason_Remark,
	CAST(Tenor_Mismatch_Ind  AS  STRING)  AS  Tenor_Mismatch_Ind,
	CAST(Tenor_Mismatch_Reason  AS  STRING)  AS  Tenor_Mismatch_Reason,
	CAST(Tenor_Mismatch_Reason_Remark  AS  STRING)  AS  Tenor_Mismatch_Reason_Remark,
	CAST(VC_AS  AS  STRING)  AS  VC_AS,
	CAST(Vul_Cust  AS  STRING)  AS  Vul_Cust,
	CAST(Vul_Cust_Optout_Witness_Ind  AS  STRING)  AS  Vul_Cust_Optout_Witness_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Doc_Nbr,
Doc_Type_Code,
Event_Br_Code,
Event_Seller_Id,
Frequent_Trader_Ind,
Frequent_Trader_Reason,
Frequent_Trader_Reason_Remark,
Fund_Type_Code,
Fund_Type_Desc,
Issue_Country_Code,
Objective_Mismatch_Ind,
Objective_Mismatch_Reason,
Objective_Mismatch_Reason_Remark,
Order_Type_Ind,
Prod_Name,
Prod_Objective_Ind,
Prod_Risk_Rating,
Prod_Tenor,
Quest_ID,
Risk_Disclosure_Ind,
Risk_Mismatch_Ind,
Risk_Mismatch_Reason,
Risk_Mismatch_Reason_Remark,
Same_Fund_Switch_Ind,
Same_Fund_Switch_Reason,
Same_Fund_Switch_Reason_Remark,
Short_Hold_Ind,
Short_Hold_Period,
Short_Hold_Reason,
Short_Hold_Reason_Remark,
Tenor_Mismatch_Ind,
Tenor_Mismatch_Reason,
Tenor_Mismatch_Reason_Remark,
VC_AS,
Vul_Cust,
Vul_Cust_Optout_Witness_Ind,
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
