*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/BuzzPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
Postar Mensagem No Buzz Com Sucesso
    [Documentation]    Publica mensagem no Buzz e valida toast de sucesso.
    [Tags]    regression
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Open Buzz Module
    Post Buzz Message    Hey, minha primeira postagem!