CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_acct_limit_raw`  (
acct_nbr  STRING(20),
appl_id  STRING(3),
control_fields  STRING(8),
limit_type_code  STRING(3),
update_dte  STRING(8),
limit_amt  STRING(15),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
