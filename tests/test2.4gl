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

    DEFINE v, refMsg STRING

    -- Frontend Call:
    -- FunctionCall 135 (paramCount = "1", returnCount = "1", moduleName = "standard", name = "feInfo", isSystem = "0") {
    --   FunctionCallParameter 136 (value = "feName", isNull = "0", dataType = "STRING") { } }
    -- Frontend result:
    -- <FunctionCallEvent id="0" result="0" ><FunctionCallReturn id="0" dataType="STRING" isNull="0" value="Genero Desktop Client" ></FunctionCallReturn></FunctionCallEvent>



    WAIT_FOR_APPLICATION("app_13108", 7230)
   
    FOCUS_FIELD("app_13108", "formonly.op1")
    INPUT_FIELD("app_13108", "formonly.op1", "r")
    SEND_KEY("app_13108", "Tab")

    LET v = GGCTestUtils.ggcGetCurrentApplicationError()

    ASSERT_NULL(NOT v)
    {
	IF v IS NULL THEN
		DISPLAY SFMT("%1:%2:error: Expecting an error but none detected", __FILE__, __LINE__)
		EXIT PROGRAM 1
	END IF
    }
    
	LET refMsg = "Error in field."
    ASSERT_EQUALS(v,refMsg)
    {
	IF NOT v.equals(refMsg) THEN
		DISPLAY SFMT("%1:%2:error: Unexpected error message: expecting [%3] but received [%4]", __FILE__, __LINE__, refMsg, v)
		EXIT PROGRAM 1
	END IF
    }
    
    SEND_ACTION("app_13108", "close")

    APPLICATION_ENDED("app_13108", 0)
    
END FUNCTION -- ggc_sample_test
