*** Settings ***
Library    Browser
Resource   ../locators/modules.robot
Resource   ../common/util.robot

*** Keywords ***
Open Leave Module
    [Documentation]    Acessa módulo Leave e valida botão submit visível.
    Wait For And Click    ${LEAVE_MENU}
    Wait For Elements State    ${SUBMIT_BUTTON}    visible