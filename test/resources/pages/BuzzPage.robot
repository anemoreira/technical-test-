*** Settings ***
Library    Browser
Resource   ../locators/buzz.robot
Resource   ../common/util.robot

*** Keywords ***
Open Buzz Module
    [Documentation]    Navega ao módulo Buzz e valida editor visível.
    Wait For And Click    ${BUZZ_MENU}
    Wait For Elements State    ${BUZZ_TEXTAREA}    visible

Post Buzz Message
    [Arguments]    ${message}
    [Documentation]    Publica mensagem no Buzz e valida toast de sucesso.
    Input Text And Wait    ${BUZZ_TEXTAREA}    ${message}
    Wait For And Click    ${BUZZ_SUBMIT}
    Assert Toast Success    ${TOAST_SUCCESS}