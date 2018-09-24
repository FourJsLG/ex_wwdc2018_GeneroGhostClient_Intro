# ================================================================================================================
# GENERATED MAIN TEST
# Using Genero Ghost Client 1.10.08-201802011654
# ================================================================================================================

&include "GGCTestUtilsMacro.4gl"

IMPORT FGL GGCTestUtils

DEFINE ggcStartTimeStamp     DATETIME YEAR TO SECOND

MAIN
    DEFINE args DYNAMIC ARRAY OF STRING
    DEFINE i INTEGER

    FOR i = 1 TO  NUM_ARGS()
        LET args[i] = ARG_VAL(i)
    END FOR

    LET ggcStartTimeStamp = CURRENT
    CALL GGCTestUtils.createSession("ggc_sample", args)
    CALL ggc_sample_test()

    CALL GGCTestUtils.finishSession()
    CALL GGCTestUtils.printSummary()
    IF GGCTestUtils.getErrorCount() > 0 THEN
        EXIT PROGRAM 1
    END IF
END MAIN


FUNCTION ggc_sample_test()

    WAIT_FOR_APPLICATION("app_7276", 4592)
    FOCUS_FIELD("app_7276", "formonly.op1")
    INPUT_FIELD("app_7276", "formonly.op1", "1")
    FOCUS_FIELD("app_7276", "formonly.op2")
    INPUT_FIELD("app_7276", "formonly.op2", "2")
    SEND_ACTION("app_7276", "plus")
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/16/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "1") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "2") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.result"), "3") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.remaind"), "") --INTEGER
    SEND_ACTION("app_7276", "close")
    APPLICATION_ENDED("app_7276", 0)
    
END FUNCTION -- ggc_sample_test
