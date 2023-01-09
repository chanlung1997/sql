WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_lrs_tagging_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Batch_Dte  AS  DATE)  AS  Batch_Dte,
	SAFE_CAST(Tag_Entity_Id  AS  STRING)  AS  Tag_Entity_Id,
	SAFE_CAST(Seq_Nbr  AS  INT64)  AS  Seq_Nbr,
	SAFE_CAST(Actv_Type  AS  STRING)  AS  Actv_Type,
	SAFE_CAST(Curr_Page  AS  STRING)  AS  Curr_Page,
	SAFE_CAST(Device_Model1  AS  STRING)  AS  Device_Model1,
	SAFE_CAST(Device_Model2  AS  STRING)  AS  Device_Model2,
	SAFE_CAST(Device_OS_Ver  AS  STRING)  AS  Device_OS_Ver,
	SAFE_CAST(Input_Field_Time_Spent  AS  INT64)  AS  Input_Field_Time_Spent,
	SAFE_CAST(Is_Horizontal_Ind  AS  STRING)  AS  Is_Horizontal_Ind,
	SAFE_CAST(Mall_User_Id1  AS  STRING)  AS  Mall_User_Id1,
	SAFE_CAST(Mall_User_Id2  AS  STRING)  AS  Mall_User_Id2,
	SAFE_CAST(Prev_Page  AS  STRING)  AS  Prev_Page,
	SAFE_CAST(Scroll_Depth_X_Start  AS  NUMERIC)  AS  Scroll_Depth_X_Start,
	SAFE_CAST(Scroll_Depth_X_End  AS  NUMERIC)  AS  Scroll_Depth_X_End,
	SAFE_CAST(Scroll_Depth_Y_Start  AS  NUMERIC)  AS  Scroll_Depth_Y_Start,
	SAFE_CAST(Scroll_Depth_Y_End  AS  NUMERIC)  AS  Scroll_Depth_Y_End,
	SAFE_CAST(Session_Id  AS  STRING)  AS  Session_Id,
	SAFE_CAST(Tag_Event_Timestamp  AS  INT64)  AS  Tag_Event_Timestamp,
	SAFE_CAST(Tag_Name  AS  STRING)  AS  Tag_Name,
	SAFE_CAST(UUID1  AS  STRING)  AS  UUID1,
	SAFE_CAST(UUID2  AS  STRING)  AS  UUID2
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
	UUID2,
	{{  full_valid_flag(['__NoFutureDate_valid_Batch_Dte','__Actv_Type_valid_Actv_Type'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
