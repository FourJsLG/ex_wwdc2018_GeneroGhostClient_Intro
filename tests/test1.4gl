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
    -- FunctionCall 135 (paramCount = "1", returnCount = "1", moduleName = "standard", name = "feInfo", isSystem = "0") {
    --   FunctionCallParameter 136 (value = "feName", isNull = "0", dataType = "STRING") { } }
    -- Frontend result:
    -- <FunctionCallEvent id="0" result="0" ><FunctionCallReturn id="0" dataType="STRING" isNull="0" value="Genero Desktop Client" ></FunctionCallReturn></FunctionCallEvent>



    WAIT_FOR_APPLICATION("app_9964", 7676)
    ASSERT_EQUALS(getWindowName(), "w1")
    ASSERT_EQUALS(getWindowTitle(), "Calculator GGC demo")
    ASSERT_EQUALS(getFormName(), "ggc_sample")
    ASSERT_EQUALS(getFocused(), "formonly.now")
    -- DialogType:Input
    ASSERT(getActionActive("accept")) --OK
    ASSERT(getActionActive("cancel")) --Cancel
    ASSERT(getActionActive("close")) --Close
    ASSERT(getActionActive("plus"))
    ASSERT(getActionActive("minus"))
    ASSERT(getActionActive("multiply"))
    ASSERT(getActionActive("divide"))
    ASSERT(getActionActive("newprog"))
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/18/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "") --INTEGER
    ASSERT_NULL(getFieldValue("formonly.result")) --null
    ASSERT_NULL(getFieldValue("formonly.remaind")) --null

    FOCUS_FIELD("app_9964", "formonly.now")
    FOCUS_FIELD("app_9964", "formonly.op1")

    WAIT_FOR_APPLICATION("app_9964", 12878)
    ASSERT_EQUALS(getWindowName(), "w1")
    ASSERT_EQUALS(getWindowTitle(), "Calculator GGC demo")
    ASSERT_EQUALS(getFormName(), "ggc_sample")
    ASSERT_EQUALS(getFocused(), "formonly.op1")
    -- DialogType:Input
    ASSERT(getActionActive("accept")) --OK
    ASSERT(getActionActive("cancel")) --Cancel
    ASSERT(getActionActive("close")) --Close
    ASSERT(getActionActive("plus"))
    ASSERT(getActionActive("minus"))
    ASSERT(getActionActive("multiply"))
    ASSERT(getActionActive("divide"))
    ASSERT(getActionActive("newprog"))
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/18/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "") --INTEGER
    ASSERT_NULL(getFieldValue("formonly.result")) --null
    ASSERT_NULL(getFieldValue("formonly.remaind")) --null

    INPUT_FIELD("app_9964", "formonly.op1", "e")
    SEND_KEY("app_9964", "Tab")

    WAIT_FOR_APPLICATION("app_9964", 15226)
    ASSERT_EQUALS(getWindowName(), "w1")
    ASSERT_EQUALS(getWindowTitle(), "Calculator GGC demo")
    ASSERT_EQUALS(getFormName(), "ggc_sample")
    ASSERT_EQUALS(getFocused(), "formonly.op1")
    -- DialogType:Input
    ASSERT(getActionActive("accept")) --OK
    ASSERT(getActionActive("cancel")) --Cancel
    ASSERT(getActionActive("close")) --Close
    ASSERT(getActionActive("plus"))
    ASSERT(getActionActive("minus"))
    ASSERT(getActionActive("multiply"))
    ASSERT(getActionActive("divide"))
    ASSERT(getActionActive("newprog"))
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/18/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "e") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "") --INTEGER
    ASSERT_NULL(getFieldValue("formonly.result")) --null
    ASSERT_NULL(getFieldValue("formonly.remaind")) --null

    INPUT_FIELD("app_9964", "formonly.op1", "1")
    FOCUS_FIELD("app_9964", "formonly.op2")

    WAIT_FOR_APPLICATION("app_9964", 17884)
    ASSERT_EQUALS(getWindowName(), "w1")
    ASSERT_EQUALS(getWindowTitle(), "Calculator GGC demo")
    ASSERT_EQUALS(getFormName(), "ggc_sample")
    ASSERT_EQUALS(getFocused(), "formonly.op2")
    -- DialogType:Input
    ASSERT(getActionActive("accept")) --OK
    ASSERT(getActionActive("cancel")) --Cancel
    ASSERT(getActionActive("close")) --Close
    ASSERT(getActionActive("plus"))
    ASSERT(getActionActive("minus"))
    ASSERT(getActionActive("multiply"))
    ASSERT(getActionActive("divide"))
    ASSERT(getActionActive("newprog"))
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/18/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "1") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "") --INTEGER
    ASSERT_NULL(getFieldValue("formonly.result")) --null
    ASSERT_NULL(getFieldValue("formonly.remaind")) --null

    INPUT_FIELD("app_9964", "formonly.op2", "2")
    SEND_ACTION("app_9964", "plus")

    WAIT_FOR_APPLICATION("app_9964", 22506)
    ASSERT_EQUALS(getWindowName(), "w1")
    ASSERT_EQUALS(getWindowTitle(), "Calculator GGC demo")
    ASSERT_EQUALS(getFormName(), "ggc_sample")
    ASSERT_EQUALS(getFocused(), "formonly.op2")
    -- DialogType:Input
    ASSERT(getActionActive("accept")) --OK
    ASSERT(getActionActive("cancel")) --Cancel
    ASSERT(getActionActive("close")) --Close
    ASSERT(getActionActive("plus"))
    ASSERT(getActionActive("minus"))
    ASSERT(getActionActive("multiply"))
    ASSERT(getActionActive("divide"))
    ASSERT(getActionActive("newprog"))
    ASSERT_EQUALS(getFieldValue("formonly.now"), "09/18/2018") --DATE
    ASSERT_EQUALS(getFieldValue("formonly.op1"), "1") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.op2"), "2") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.result"), "3") --INTEGER
    ASSERT_EQUALS(getFieldValue("formonly.remaind"), "") --INTEGER

    SEND_ACTION("app_9964", "close")

    APPLICATION_ENDED("app_9964", 0)
END FUNCTION -- ggc_sample_test
