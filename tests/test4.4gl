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
    -- FunctionCall 144 (isSystem = "0", moduleName = "standard", name = "feInfo", paramCount = "1", returnCount = "1") {
    --   FunctionCallParameter 145 (value = "osType", dataType = "STRING", isNull = "0") { } }
    -- Frontend result:
    -- <FunctionCallEvent id="0" result="0" ><FunctionCallReturn id="0" dataType="STRING" isNull="0" value="WINDOWS" ></FunctionCallReturn></FunctionCallEvent>



    WAIT_FOR_APPLICATION("app_21428", 4285)
    
    ASSERT_EQUALS(getFieldValue("formonly.now"),TODAY) --DATE
    
    FOCUS_FIELD("app_21428", "formonly.op1")

    

    INPUT_FIELD("app_21428", "formonly.op1", "1")
    FOCUS_FIELD("app_21428", "formonly.op2")

    

    INPUT_FIELD("app_21428", "formonly.op2", "2")
    SEND_ACTION("app_21428", "plus")

    
    ASSERT_EQUALS(getFieldValue("formonly.result"), "3") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.remaind"), "") --INTEGER

    SEND_ACTION("app_21428", "close")

    APPLICATION_ENDED("app_21428", 0)
END FUNCTION -- ggc_sample_test
