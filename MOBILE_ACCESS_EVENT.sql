WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.MOBILE_ACCESS_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Device_Brand  AS  STRING)  AS  Device_Brand,
	CAST(Device_Id  AS  STRING)  AS  Device_Id,
	CAST(Device_Model  AS  STRING)  AS  Device_Model,
	CAST(Device_OS_Ver  AS  STRING)  AS  Device_OS_Ver,
	CAST(Device_Platform  AS  STRING)  AS  Device_Platform,
	CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	CAST(Event_Time  AS  INT64)  AS  Event_Time
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
