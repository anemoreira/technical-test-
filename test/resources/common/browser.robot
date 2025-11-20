*** Settings ***
Library    Browser
Resource   ../locators/login.robot
Resource   ../../env/dev.robot

*** Keywords ***
Open Browser To Base Url
    [Arguments]    ${base_url}=${BASE_URL}
    [Documentation]    Abre o navegador com Playwright (Browser lib) e acessa a Base URL.
    New Browser    browser=chromium    headless=${HEADLESS}
    New Context
    New Page    ${base_url}
    ${_}=    Set Variable    ${DEFAULT_TIMEOUT}
    Wait For Elements State    ${LOGIN_USERNAME_INPUT}    visible    timeout=${DEFAULT_TIMEOUT}

Navigate To Base Url
    [Arguments]    ${base_url}=${BASE_URL}
    [Documentation]    Navega para a Base URL e valida campo de login visível.
    Go To    ${base_url}
    Wait For Elements State    ${LOGIN_USERNAME_INPUT}    visible    timeout=${DEFAULT_TIMEOUT}

Close Browser Session
    [Documentation]    Fecha o navegador atual.
    Close Browser