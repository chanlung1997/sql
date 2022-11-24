WITH CTE_1 AS (
SELECT 
    *
FROM gcp-prj-dat-bigquery-env-00.bqd_015_raw.BR_FIN_EVENT_raw
),

CTE_2 AS (
SELECT 
    CAST(Acct_Nbr AS INT64) AS Acct_Nbr,
    CAST(Appl_Id AS STRING) AS Appl_Id,
    CAST(Control_Fields AS STRING) AS Control_Fields,
    CAST(Trx_Nbr AS STRING) AS Trx_Nbr,
    CAST(Acct_Amt AS NUMERIC) AS Acct_Amt,
    CAST(Acct_Ccy_Code AS STRING) AS Acct_Ccy_Code,
    CAST(Acct_Handling_Br_Code AS STRING) AS Acct_Handling_Br_Code,
    CAST(Begin_Bal_Amt AS NUMERIC) AS Begin_Bal_Amt,
    CAST(Cash_Trx_Ind AS STRING) AS Cash_Trx_Ind,
    CAST(Chq_Nbr AS NUMERIC) AS Chq_Nbr,
    CAST(Chq_Type AS STRING) AS Chq_Type,
    CAST(CNH_Rate_Ind AS STRING) AS CNH_Rate_Ind,
    CAST(CNY_Trx_Amt_Override_Ind AS STRING) AS CNY_Trx_Amt_Override_Ind,
    CAST(CNY_Trx_Cnt_Override_Ind AS STRING) AS CNY_Trx_Cnt_Override_Ind,
    CAST(Correction_Ind AS STRING) AS Correction_Ind,
    CAST(Counter_Ex_Rate AS NUMERIC) AS Counter_Ex_Rate,
    CAST(Event_Actv_Type_Code AS STRING) AS Event_Actv_Type_Code,
    CAST(Event_Amt AS NUMERIC) AS Event_Amt,
    CAST(Event_Amt_Hke AS NUMERIC) AS Event_Amt_Hke,
    CAST(Event_Ccy_Code AS STRING) AS Event_Ccy_Code,
    CAST(Event_Centre AS STRING) AS Event_Centre,
    CAST(Event_Chnl AS STRING) AS Event_Chnl,
    CAST(Event_Dte AS DATE) AS Event_Dte,
    CAST(Event_Ex_Rate AS NUMERIC) AS Event_Ex_Rate,
    CAST(Event_Narrative AS STRING) AS Event_Narrative,
    CAST(Event_Posted_Ind AS STRING) AS Event_Posted_Ind,
    CAST(Event_Time AS INT64) AS Event_Time,
    CAST(MSOF_Ref AS STRING) AS MSOF_Ref,
    CAST(Passbook_Trx_Ref AS STRING) AS Passbook_Trx_Ref,
    CAST(POF_Remarks AS STRING) AS POF_Remarks,
    CAST(Purpose_Of_Fund AS STRING) AS Purpose_Of_Fund,
    CAST(Rel_to_Acct_Hldr AS STRING) AS Rel_to_Acct_Hldr,
    CAST(Source_Of_Fund AS STRING) AS Source_Of_Fund,
    CAST(Stmt_Trx_Ref_1 AS STRING) AS Stmt_Trx_Ref_1,
    CAST(Stmt_Trx_Ref_2 AS STRING) AS Stmt_Trx_Ref_2,
    CAST(Stmt_Trx_Ref_3 AS STRING) AS Stmt_Trx_Ref_3,
    CAST(Third_Party_Trx_Ind AS STRING) AS Third_Party_Trx_Ind,
    CAST(Trade_Certified_Code AS STRING) AS Trade_Certified_Code,
    CAST(Trade_Ind AS STRING) AS Trade_Ind,
    CAST(User_Id AS STRING) AS User_Id,
    CAST(Val_Dte AS DATE) AS Val_Dte,
FROM CTE_1
),

CTE_3 AS (
SELECT 
    *,
    {{ validate_01YN('Cash_Trx_Ind') }} ,
    {{ validate_01YN('CNH_Rate_Ind') }} ,
    {{ validate_01YN('CNY_Trx_Amt_Override_Ind') }} ,
    {{ validate_01YN('CNY_Trx_Cnt_Override_Ind') }} ,
    {{ validate_01YN('Correction_Ind') }} ,
    {{ validate_01YN('Event_Posted_Ind') }} ,
    {{ validate_01YN('Third_Party_Trx_Ind') }} ,
    {{ validate_01YN('Trade_Ind') }} ,
    {{ validate_Future_Date('Val_Dte') }} ,
FROM CTE_2
),

CTE_4 AS (
SELECT 
Acct_Nbr,
Appl_Id,
Control_Fields,
Trx_Nbr,
Acct_Amt,
Acct_Ccy_Code,
Acct_Handling_Br_Code,
Begin_Bal_Amt,
Cash_Trx_Ind,
Chq_Nbr,
Chq_Type,
CNH_Rate_Ind,
CNY_Trx_Amt_Override_Ind,
CNY_Trx_Cnt_Override_Ind,
Correction_Ind,
Counter_Ex_Rate,
Event_Actv_Type_Code,
Event_Amt,
Event_Amt_Hke,
Event_Ccy_Code,
Event_Centre,
Event_Chnl,
Event_Dte,
Event_Ex_Rate,
Event_Narrative,
Event_Posted_Ind,
Event_Time,
MSOF_Ref,
Passbook_Trx_Ref,
POF_Remarks,
Purpose_Of_Fund,
Rel_to_Acct_Hldr,
Source_Of_Fund,
Stmt_Trx_Ref_1,
Stmt_Trx_Ref_2,
Stmt_Trx_Ref_3,
Third_Party_Trx_Ind,
Trade_Certified_Code,
Trade_Ind,
User_Id,
Val_Dte,
    {{ aggregate_validation_columns(['__01YN_Cash_Trx_Ind','__01YN_CNH_Rate_Ind','__01YN_CNY_Trx_Amt_Override_Ind','__01YN_CNY_Trx_Cnt_Override_Ind','__01YN_Correction_Ind','__01YN_Event_Posted_Ind','__01YN_Third_Party_Trx_Ind','__01YN_Trade_Ind','__Future_Date_Val_Dte',]) }}
FROM CTE_3
)

SELECT * FROM CTE_4