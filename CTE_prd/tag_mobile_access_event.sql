WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_mobile_access_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Device_Brand  AS  STRING)  AS  Device_Brand,
	SAFE_CAST(Device_Id  AS  STRING)  AS  Device_Id,
	SAFE_CAST(Device_Model  AS  STRING)  AS  Device_Model,
	SAFE_CAST(Device_OS_Ver  AS  STRING)  AS  Device_OS_Ver,
	SAFE_CAST(Device_Platform  AS  STRING)  AS  Device_Platform,
	SAFE_CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	SAFE_CAST(Event_Time  AS  INT64)  AS  Event_Time,
	SAFE_CAST(IP_Addr  AS  STRING)  AS  IP_Addr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
