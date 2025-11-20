*** Settings ***
Library    Browser
Resource   ../locators/modules.robot
Resource   ../common/util.robot

*** Keywords ***
Open My Info Module
    [Documentation]    Acessa módulo My Info e valida link de Personal Details visível.
    Wait For And Click    ${MYINFO_MENU}
    Wait For Elements State    ${PERSONAL_DETAILS_LINK}    visible