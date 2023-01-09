CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_stock_raw`  (
stock_code  STRING(5),
ccy_code  STRING(3),
stock_name  STRING(40),
stock_type_code  STRING(1),
stock_unit_code  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
