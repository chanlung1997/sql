CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_rci_invest_event_raw`  (
Trx_Linked_Ref  STRING(18),
Prod_Code  STRING(11),
Source_Id  STRING(3),
Acct_Nbr  STRING(20),
AP_Ind  STRING(1),
Appl_Id  STRING(3),
Asset_Concentration_Ind  STRING(1),
Asset_Concentration_Reason  STRING(2),
Asset_Concentration_Reason_Remark  STRING(60),
Audio_Record_Ind  STRING(1),
Chnl_Id  STRING(14),
Chnl_Type_Code  STRING(3),
Control_Fields  STRING(8),
Cust_Objective_Ind  STRING(1),
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Event_Br_Code  STRING(4),
Event_Seller_Id  STRING(8),
Frequent_Trader_Ind  STRING(1),
Frequent_Trader_Reason  STRING(2),
Frequent_Trader_Reason_Remark  STRING(60),
Fund_Type_Code  STRING(20),
Fund_Type_Desc  STRING(254),
Issue_Country_Code  STRING(2),
Objective_Mismatch_Ind  STRING(1),
Objective_Mismatch_Reason  STRING(2),
Objective_Mismatch_Reason_Remark  STRING(60),
Order_Type_Ind  STRING(1),
Prod_Name  STRING(254),
Prod_Objective_Ind  STRING(1),
Prod_Risk_Rating  STRING(1),
Prod_Tenor  STRING(1),
Quest_ID  STRING(19),
Risk_Disclosure_Ind  STRING(1),
Risk_Mismatch_Ind  STRING(1),
Risk_Mismatch_Reason  STRING(2),
Risk_Mismatch_Reason_Remark  STRING(60),
Same_Fund_Switch_Ind  STRING(1),
Same_Fund_Switch_Reason  STRING(2),
Same_Fund_Switch_Reason_Remark  STRING(60),
Short_Hold_Ind  STRING(1),
Short_Hold_Period  STRING(3),
Short_Hold_Reason  STRING(2),
Short_Hold_Reason_Remark  STRING(60),
Tenor_Mismatch_Ind  STRING(1),
Tenor_Mismatch_Reason  STRING(2),
Tenor_Mismatch_Reason_Remark  STRING(60),
VC_AS  STRING(1),
Vul_Cust  STRING(1),
Vul_Cust_Optout_Witness_Ind  STRING(1),
Witness_Arrange  STRING(1),
__row_number  STRING,   
__sys_code  STRING,   
__file_name  STRING,   
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__load_type  STRING 
);
