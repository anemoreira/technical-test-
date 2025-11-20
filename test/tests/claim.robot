*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/ClaimPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
Claim Módulo Visível
    [Documentation]    Abre módulo Claim e valida botão de submit visível.
    [Tags]    regression
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Open Claim Module