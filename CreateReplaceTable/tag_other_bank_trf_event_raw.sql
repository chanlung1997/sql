CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_other_bank_trf_event_raw`  (
Event_Id  STRING(23),
Applicant_Name  STRING(180),
Applicant_Place_of_Operation  STRING(2),
Applicant_Place_Of_Origin  STRING(2),
Backdate_Ind  STRING(1),
Bank_To_Bank_Info  STRING(210),
BEA_China_Br_Code  STRING(3),
Ben_Acct_Nbr  STRING(35),
Ben_Country_Code  STRING(2),
Ben_Instit_Country_Code  STRING(2),
Ben_Instit_Info  STRING(20),
Ben_Instit_Name  STRING(180),
Ben_Name  STRING(180),
Ccy_Code  STRING(3),
Clearing_Bank_Code  STRING(3),
CNAPS_Ind  STRING(1),
CNH_Rate_Ind  STRING(1),
CNY_TT_Categ_Code  STRING(6),
CNY_TT_Trade_Ind  STRING(1),
Covering_Bank_Code  STRING(11),
Credit_Dte  STRING(8),
Eff_Dte  STRING(8),
Event_Amt  STRING(15),
Event_Amt_Hke  STRING(15),
Event_Rem  STRING(210),
Event_Rem2  STRING(220),
Ext_Cust_Country_Code  STRING(2),
Ext_Cust_Info  STRING(180),
FFM_Ovr_Id  STRING(8),
GCO_Waived_Ind  STRING(1),
HIT_Ind  STRING(1),
HKID_Resident_Ind  STRING(1),
HKL_Message_Ind  STRING(1),
Instit_Country_Code  STRING(2),
Instit_Info  STRING(180),
Instit_Info_Id  STRING(34),
Instit_Info_Rem  STRING(180),
Inter_Bank_Country_Code  STRING(2),
Inter_Bank_Info  STRING(180),
Msg_Type  STRING(4),
MT191_Ind  STRING(1),
MT910_Ind  STRING(1),
Net_Pay_Amt  STRING(15),
Net_Pay_Ccy_Code  STRING(3),
Net_Proceeds  STRING(17),
Net_Proceeds_Hke  STRING(17),
New_Fund_Ind  STRING(1),
Other_Bank_Acct_Nbr  STRING(20),
Paying_Bank_Code  STRING(11),
Pmt_Code  STRING(2),
Pmt_Method_Code  STRING(1),
POF_Remarks  STRING(25),
Purpose_Of_Fund  STRING(1),
Purpose_Of_Fund_Remarks  STRING(20),
Purpose_Of_Pmt_BH  STRING(3),
Purpose_Of_Pmt_UAE  STRING(3),
Receiver_Corr  STRING(140),
Receiver_Corr_Bank_Id  STRING(34),
Reject_Reason_Code  STRING(4),
Rel_to_Acct_Hldr  STRING(1),
Rel_to_Acct_Hldr_Remarks  STRING(20),
Related_Acct_Nbr  STRING(20),
Related_Appl_Id  STRING(3),
Related_Control_Fields  STRING(8),
Return_Reason  STRING(54),
Settle_Method  STRING(2),
Sgold_Ind  STRING(1),
SLA_Id  STRING(3),
Source_Of_Fund  STRING(1),
Source_Of_Fund_Remarks  STRING(20),
Stf_Nbr  STRING(10),
Trade_Certified_Code  STRING(1),
Trade_Ind  STRING(1),
Treasury_Ref  STRING(7),
UETR  STRING(36),
Ultimate_Instit_Country_Code  STRING(3),
Ultimate_Instit_Info  STRING(11),
Ultimate_Instit_Info_Id  STRING(24),
Ultimate_Instit_Info_Rem  STRING(140),
__row_number  STRING,   
__sys_code  STRING,   
__file_name  STRING,   
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__load_type  STRING 
);
