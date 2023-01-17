WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_chnl_type_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Chnl_Type_Desc  AS  STRING)  AS  Chnl_Type_Desc,
	SAFE_CAST(Chnl_Type_End_Dte  AS  DATE)  AS  Chnl_Type_End_Dte,
	SAFE_CAST(Chnl_Type_Group_Code  AS  STRING)  AS  Chnl_Type_Group_Code,
	SAFE_CAST(Chnl_Type_Name  AS  STRING)  AS  Chnl_Type_Name,
	SAFE_CAST(Chnl_Type_Start_Dte  AS  DATE)  AS  Chnl_Type_Start_Dte,
	SAFE_CAST(Chnl_Type_Status_Code  AS  STRING)  AS  Chnl_Type_Status_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Chnl_Type_Name('Chnl_Type_Name')}},
	{{validate_NoFutureDate('Chnl_Type_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Chnl_Type_Code,
	Chnl_Type_Desc,
	Chnl_Type_End_Dte,
	Chnl_Type_Group_Code,
	Chnl_Type_Name,
	Chnl_Type_Start_Dte,
	Chnl_Type_Status_Code,
	{{  full_valid_flag(['__Chnl_Type_Name_valid_Chnl_Type_Name','__NoFutureDate_valid_Chnl_Type_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
