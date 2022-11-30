WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.INSL_PMT_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Adj_Int_Amt  AS  NUMERIC)  AS  Adj_Int_Amt,
	CAST(Adj_Od_Int_Amt  AS  NUMERIC)  AS  Adj_Od_Int_Amt,
	CAST(Due_Dte  AS  DATE)  AS  Due_Dte,
	CAST(Gen_From  AS  STRING)  AS  Gen_From,
	CAST(Gov_Claim_Ind  AS  STRING)  AS  Gov_Claim_Ind,
	CAST(Gov_Reimburs_Amt  AS  NUMERIC)  AS  Gov_Reimburs_Amt,
	CAST(Impair_Ind  AS  STRING)  AS  Impair_Ind,
	CAST(Insl_Nbr  AS  STRING)  AS  Insl_Nbr,
	CAST(Int_Amt  AS  NUMERIC)  AS  Int_Amt,
	CAST(Nbr_Of_Insl_In_Arrear  AS  NUMERIC)  AS  Nbr_Of_Insl_In_Arrear,
	CAST(Pmt_Mode_Code  AS  STRING)  AS  Pmt_Mode_Code,
	CAST(Pmt_Nbr  AS  STRING)  AS  Pmt_Nbr,
	CAST(Pmt_Type_Code  AS  STRING)  AS  Pmt_Type_Code,
	CAST(Prin_Amt  AS  NUMERIC)  AS  Prin_Amt,
	CAST(Prin_Bal  AS  NUMERIC)  AS  Prin_Bal,
	CAST(Rev_Dte  AS  DATE)  AS  Rev_Dte
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
	{{  aggregate_validation_columns(['__Future_Date_valid_Due_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
