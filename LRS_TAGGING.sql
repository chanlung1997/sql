WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.LRS_TAGGING_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Batch_Dte  AS  DATE)  AS  Batch_Dte,
	CAST(Tag_Entity_Id  AS  STRING)  AS  Tag_Entity_Id,
	CAST(Seq_Nbr  AS  INT64)  AS  Seq_Nbr,
	CAST(Actv_Type  AS  STRING)  AS  Actv_Type,
	CAST(Curr_Page  AS  STRING)  AS  Curr_Page,
	CAST(Device_Model1  AS  STRING)  AS  Device_Model1,
	CAST(Device_Model2  AS  STRING)  AS  Device_Model2,
	CAST(Device_OS_Ver  AS  STRING)  AS  Device_OS_Ver,
	CAST(Input_Field_Time_Spent  AS  INT64)  AS  Input_Field_Time_Spent,
	CAST(Is_Horizontal_Ind  AS  STRING)  AS  Is_Horizontal_Ind,
	CAST(Mall_User_Id1  AS  STRING)  AS  Mall_User_Id1,
	CAST(Mall_User_Id2  AS  STRING)  AS  Mall_User_Id2,
	CAST(Prev_Page  AS  STRING)  AS  Prev_Page,
	CAST(Scroll_Depth_X_Start  AS  NUMERIC)  AS  Scroll_Depth_X_Start,
	CAST(Scroll_Depth_X_End  AS  NUMERIC)  AS  Scroll_Depth_X_End,
	CAST(Scroll_Depth_Y_Start  AS  NUMERIC)  AS  Scroll_Depth_Y_Start,
	CAST(Scroll_Depth_Y_End  AS  NUMERIC)  AS  Scroll_Depth_Y_End,
	CAST(Session_Id  AS  STRING)  AS  Session_Id,
	CAST(Tag_Event_Timestamp  AS  INT64)  AS  Tag_Event_Timestamp,
	CAST(Tag_Name  AS  STRING)  AS  Tag_Name,
	CAST(UUID1  AS  STRING)  AS  UUID1
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Batch_Dte')}},
	{{validate_Actv_Type('Actv_Type')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Batch_Dte,
Tag_Entity_Id,
Seq_Nbr,
Actv_Type,
Curr_Page,
Device_Model1,
Device_Model2,
Device_OS_Ver,
Input_Field_Time_Spent,
Is_Horizontal_Ind,
Mall_User_Id1,
Mall_User_Id2,
Prev_Page,
Scroll_Depth_X_Start,
Scroll_Depth_X_End,
Scroll_Depth_Y_Start,
Scroll_Depth_Y_End,
Session_Id,
Tag_Event_Timestamp,
Tag_Name,
UUID1,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Batch_Dte','__Actv_Type_valid_Actv_Type'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
