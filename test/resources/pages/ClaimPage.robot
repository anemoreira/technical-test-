*** Settings ***
Library    Browser
Resource   ../locators/modules.robot
Resource   ../common/util.robot

*** Keywords ***
Open Claim Module
    [Documentation]    Acessa módulo Claim e valida botão submit visível.
    Wait For And Click    ${CLAIM_MENU}
    Wait For Elements State    ${SUBMIT_BUTTON}    visible