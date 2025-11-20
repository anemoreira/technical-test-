*** Settings ***
Library    Browser
Resource   ../locators/login.robot
Resource   ../common/util.robot
Resource   ../../env/dev.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}
    [Documentation]    Realiza login robusto com waits dinâmicos e retry.
    Input Text And Wait    ${LOGIN_USERNAME_INPUT}    ${username}
    Input Text And Wait    ${LOGIN_PASSWORD_INPUT}    ${password}
    Wait For And Click    ${LOGIN_SUBMIT_BUTTON}
    Wait For Elements State    ${USER_DROPDOWN}    visible

Verify Login Error Displayed
    [Documentation]    Valida mensagem de erro em login inválido.
    Wait For Elements State    ${ALERT_ERROR}    visible

Go To Forgot Password
    [Documentation]    Acessa a tela de recuperação de senha e verifica elemento.
    Wait For And Click    ${LOGIN_FORGOT_LINK}
    Wait For Elements State    ${FORGOT_RESET_BUTTON}    visible