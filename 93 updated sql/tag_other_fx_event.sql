WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_other_fx_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Applicant_Add  AS  STRING)  AS  Applicant_Add,
	SAFE_CAST(Applicant_Phone_Nbr  AS  STRING)  AS  Applicant_Phone_Nbr,
	SAFE_CAST(Bank_Buy_Amt  AS  NUMERIC)  AS  Bank_Buy_Amt,
	SAFE_CAST(Bank_Buy_Ccy_Code  AS  STRING)  AS  Bank_Buy_Ccy_Code,
	SAFE_CAST(Bank_Sell_Amt  AS  NUMERIC)  AS  Bank_Sell_Amt,
	SAFE_CAST(Bank_Sell_Ccy_Code  AS  STRING)  AS  Bank_Sell_Ccy_Code,
	SAFE_CAST(Ccy_Pair  AS  STRING)  AS  Ccy_Pair,
	SAFE_CAST(CNH_Rate_Ind  AS  STRING)  AS  CNH_Rate_Ind,
	SAFE_CAST(Comm_Rate  AS  NUMERIC)  AS  Comm_Rate,
	SAFE_CAST(Counter_Rate  AS  NUMERIC)  AS  Counter_Rate,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	SAFE_CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	SAFE_CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Party_Name  AS  STRING)  AS  Party_Name,
	SAFE_CAST(Payee_Name  AS  STRING)  AS  Payee_Name,
	SAFE_CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	SAFE_CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	SAFE_CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	SAFE_CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	SAFE_CAST(Related_Acct_Nbr  AS  INT64)  AS  Related_Acct_Nbr,
	SAFE_CAST(Related_Appl_Id  AS  STRING)  AS  Related_Appl_Id,
	SAFE_CAST(Related_Control_Fields  AS  STRING)  AS  Related_Control_Fields,
	SAFE_CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund,
	SAFE_CAST(Special_Rate  AS  NUMERIC)  AS  Special_Rate,
	SAFE_CAST(Treasury_Ref  AS  STRING)  AS  Treasury_Ref
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Phone('Applicant_Phone_Nbr')}},
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Applicant_Add,
	Applicant_Phone_Nbr,
	Bank_Buy_Amt,
	Bank_Buy_Ccy_Code,
	Bank_Sell_Amt,
	Bank_Sell_Ccy_Code,
	Ccy_Pair,
	CNH_Rate_Ind,
	Comm_Rate,
	Counter_Rate,
	Doc_Nbr,
	Doc_Type_Code,
	Event_Amt,
	Event_Amt_Hke,
	Event_Ccy_Code,
	Issue_Country_Code,
	Party_Name,
	Payee_Name,
	Pmt_Method_Code,
	POF_Remarks,
	Purpose_Of_Fund,
	Rel_to_Acct_Hldr,
	Related_Acct_Nbr,
	Related_Appl_Id,
	Related_Control_Fields,
	Source_Of_Fund,
	Special_Rate,
	Treasury_Ref,
	{{  full_valid_flag(['__Phone_valid_Applicant_Phone_Nbr','__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
