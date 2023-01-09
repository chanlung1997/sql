CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_mobile_access_event_raw`  (
Event_Id  STRING(23),
Device_Brand  STRING(64),
Device_Id  STRING(64),
Device_Model  STRING(128),
Device_OS_Ver  STRING(128),
Device_Platform  STRING(128),
Event_Dte  STRING(8),
Event_Time  STRING(8),
IP_Addr  STRING(200),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
