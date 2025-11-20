*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot
Test Setup        Navigate To Base Url    ${BASE_URL}

*** Test Cases ***
Login Válido Deve Mostrar Usuário
    [Documentation]    Realiza login com credenciais válidas e valida dropdown do usuário.
    [Tags]    smoke    login
    Login With Credentials    ${USERNAME}    ${PASSWORD}