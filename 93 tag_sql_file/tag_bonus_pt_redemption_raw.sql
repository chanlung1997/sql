CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_bonus_pt_redemption_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Order_Nbr  STRING(10),
Redemption_Dte  STRING(8),
Seq_Nbr  STRING(2),
Amount_Used  STRING(6),
Merchandise_Nbr  STRING(6),
Merchandise_Type_Code  STRING(3),
Points_Used  STRING(8),
Redeem_Conf_Dte  STRING(8),
Redeem_Conf_Ind  STRING(1),
Redeem_Method_Code  STRING(2),
Redeem_Qnty  STRING(3),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
