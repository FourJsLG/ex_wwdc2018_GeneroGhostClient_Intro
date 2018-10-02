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
    --Initialize your test session here

    -- Frontend Call:
    -- FunctionCall 135 (moduleName = "standard", name = "feInfo", paramCount = "1", isSystem = "0", returnCount = "1") {
    --   FunctionCallParameter 136 (dataType = "STRING", isNull = "0", value = "feName") { } }
    -- Frontend result:
    -- <FunctionCallEvent id="0" result="0" ><FunctionCallReturn id="0" dataType="STRING" isNull="0" value="GBC" ></FunctionCallReturn></FunctionCallEvent>



    WAIT_FOR_APPLICATION("app_13860", 2404)
    ASSERT_EQUALS(getFieldValue("formonly.now"), TODAY) --DATE
    FOCUS_FIELD("app_13860", "formonly.op1")
    INPUT_FIELD("app_13860", "formonly.op1", "1")
    FOCUS_FIELD("app_13860", "formonly.op2")
    INPUT_FIELD("app_13860", "formonly.op2", "2")
    SEND_ACTION("app_13860", "plus")
    ASSERT_EQUALS(getFieldValue("formonly.result"), "3") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.remaind"), "") --INTEGER

    SEND_ACTION("app_13860", "close")

    APPLICATION_ENDED("app_13860", 0)
    
END FUNCTION -- ggc_sample_test
