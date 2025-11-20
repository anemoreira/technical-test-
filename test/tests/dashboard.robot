*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/DashboardPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
Dashboard Visível Após Login
    [Documentation]    Valida breadcrumb do Dashboard após login bem-sucedido.
    [Tags]    smoke
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Assert Dashboard Visible