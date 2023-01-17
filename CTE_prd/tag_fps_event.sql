WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_fps_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Bill_Nbr  AS  STRING)  AS  Bill_Nbr,
	SAFE_CAST(Message_Id  AS  STRING)  AS  Message_Id,
	SAFE_CAST(Pmt_Categ_Purpose_Code  AS  STRING)  AS  Pmt_Categ_Purpose_Code,
	SAFE_CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	SAFE_CAST(Correspondent_Proxy_Id_Type  AS  STRING)  AS  Correspondent_Proxy_Id_Type,
	SAFE_CAST(Correspondent_Proxy_Id  AS  STRING)  AS  Correspondent_Proxy_Id,
	SAFE_CAST(Related_Proxy_Id_Type  AS  STRING)  AS  Related_Proxy_Id_Type,
	SAFE_CAST(Related_Proxy_Id  AS  STRING)  AS  Related_Proxy_Id,
	SAFE_CAST(Related_Bk_Code  AS  STRING)  AS  Related_Bk_Code,
	SAFE_CAST(Related_Acct_Nbr  AS  STRING)  AS  Related_Acct_Nbr,
	SAFE_CAST(Related_Cust_Name  AS  STRING)  AS  Related_Cust_Name,
	SAFE_CAST(Business_Service_Code  AS  STRING)  AS  Business_Service_Code,
	SAFE_CAST(Cust_Ref  AS  STRING)  AS  Cust_Ref,
	SAFE_CAST(Mandate_Id  AS  STRING)  AS  Mandate_Id,
	SAFE_CAST(FPS_Ref_Nbr  AS  STRING)  AS  FPS_Ref_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Max_len_10('Bill_Nbr')}},
	{{validate_Max_len_10('Related_Acct_Nbr')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Bill_Nbr,
	Message_Id,
	Pmt_Categ_Purpose_Code,
	Pmt_Method_Code,
	Correspondent_Proxy_Id_Type,
	Correspondent_Proxy_Id,
	Related_Proxy_Id_Type,
	Related_Proxy_Id,
	Related_Bk_Code,
	Related_Acct_Nbr,
	Related_Cust_Name,
	Business_Service_Code,
	Cust_Ref,
	Mandate_Id,
	FPS_Ref_Nbr,
	{{  full_valid_flag(['__Max_len_10_valid_Bill_Nbr','__Max_len_10_valid_Related_Acct_Nbr'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
