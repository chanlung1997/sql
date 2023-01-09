WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_insl_pmt_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Adj_Int_Amt  AS  NUMERIC)  AS  Adj_Int_Amt,
	SAFE_CAST(Adj_Od_Int_Amt  AS  NUMERIC)  AS  Adj_Od_Int_Amt,
	SAFE_CAST(Due_Dte  AS  DATE)  AS  Due_Dte,
	SAFE_CAST(Gen_From  AS  STRING)  AS  Gen_From,
	SAFE_CAST(Gov_Claim_Ind  AS  STRING)  AS  Gov_Claim_Ind,
	SAFE_CAST(Gov_Reimburs_Amt  AS  NUMERIC)  AS  Gov_Reimburs_Amt,
	SAFE_CAST(Impair_Ind  AS  STRING)  AS  Impair_Ind,
	SAFE_CAST(Insl_Nbr  AS  STRING)  AS  Insl_Nbr,
	SAFE_CAST(Int_Amt  AS  NUMERIC)  AS  Int_Amt,
	SAFE_CAST(Nbr_Of_Insl_In_Arrear  AS  NUMERIC)  AS  Nbr_Of_Insl_In_Arrear,
	SAFE_CAST(Pmt_Mode_Code  AS  STRING)  AS  Pmt_Mode_Code,
	SAFE_CAST(Pmt_Nbr  AS  STRING)  AS  Pmt_Nbr,
	SAFE_CAST(Pmt_Type_Code  AS  STRING)  AS  Pmt_Type_Code,
	SAFE_CAST(Prin_Amt  AS  NUMERIC)  AS  Prin_Amt,
	SAFE_CAST(Prin_Bal  AS  NUMERIC)  AS  Prin_Bal,
	SAFE_CAST(Rev_Dte  AS  DATE)  AS  Rev_Dte,
	SAFE_CAST(Settle_Mode  AS  STRING)  AS  Settle_Mode
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Due_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Adj_Int_Amt,
	Adj_Od_Int_Amt,
	Due_Dte,
	Gen_From,
	Gov_Claim_Ind,
	Gov_Reimburs_Amt,
	Impair_Ind,
	Insl_Nbr,
	Int_Amt,
	Nbr_Of_Insl_In_Arrear,
	Pmt_Mode_Code,
	Pmt_Nbr,
	Pmt_Type_Code,
	Prin_Amt,
	Prin_Bal,
	Rev_Dte,
	Settle_Mode,
	{{  full_valid_flag(['__Future_Date_valid_Due_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
