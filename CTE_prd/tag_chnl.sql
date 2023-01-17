WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_chnl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Chnl_Id  AS  STRING)  AS  Chnl_Id,
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Chnl_Subtype_Code  AS  STRING)  AS  Chnl_Subtype_Code,
	SAFE_CAST(Chnl_Desc  AS  STRING)  AS  Chnl_Desc,
	SAFE_CAST(Chnl_End_Dte  AS  DATE)  AS  Chnl_End_Dte,
	SAFE_CAST(Chnl_Start_Dte  AS  DATE)  AS  Chnl_Start_Dte,
	SAFE_CAST(Chnl_Status_Code  AS  STRING)  AS  Chnl_Status_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Chnl_End_Dte')}},
	{{validate_NoFutureDate('Chnl_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Chnl_Id,
	Chnl_Type_Code,
	Chnl_Subtype_Code,
	Chnl_Desc,
	Chnl_End_Dte,
	Chnl_Start_Dte,
	Chnl_Status_Code,
	{{  full_valid_flag(['__Future_Date_valid_Chnl_End_Dte','__NoFutureDate_valid_Chnl_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
