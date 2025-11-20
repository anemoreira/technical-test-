*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/LeavePage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
Leave Módulo Visível
    [Documentation]    Abre módulo Leave e valida botão de submit visível.
    [Tags]    regression
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Open Leave Module