*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/MyInfoPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
My Info Exibe Personal Details
    [Documentation]    Abre módulo My Info e valida link de Personal Details.
    [Tags]    regression
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Open My Info Module