*** Settings ***
Library    Browser

*** Keywords ***
Wait For And Click
    [Arguments]    ${locator}
    [Documentation]    Aguarda elemento visível e clica com tentativas.
    Wait For Elements State    ${locator}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait Until Keyword Succeeds    3x    2s    Click    ${locator}

Input Text And Wait
    [Arguments]    ${locator}    ${text}
    [Documentation]    Aguarda campo visível e digita texto.
    Wait For Elements State    ${locator}    visible    timeout=${DEFAULT_TIMEOUT}
    Fill Text    ${locator}    ${text}

Select Dropdown Option
    [Arguments]    ${dropdown_locator}    ${option_text}

    Wait For Elements State    ${dropdown_locator}    visible    timeout=30s
    Scroll To Element          ${dropdown_locator}
    Click                      ${dropdown_locator}
    Sleep    500ms 

    ${is_status}=    Run Keyword And Return Status
    ...    Should Contain    ${dropdown_locator}    Status

    IF    ${is_status}
        ${option}=    Set Variable
        ...    xpath=//div[contains(@class,'oxd-select-text-input') and normalize-space()='${option_text}']
    ELSE
        ${option}=    Set Variable
        ...    xpath=//div[contains(@class,'oxd-select-dropdown')]//span[normalize-space()='${option_text}']
    END

    Wait For Elements State    ${option}    visible    timeout=10s
    Wait Until Keyword Succeeds    2x    1s    Click    ${option}


Select Autocomplete Option
    [Arguments]    ${input_locator}    ${option_text}
    [Documentation]    Digita no autocomplete e escolhe a opção pelo texto.
    Input Text And Wait    ${input_locator}    ${option_text}
    ${opt}=    Set Variable    xpath=//div[@role='listbox']//span[contains(normalize-space(.),'${option_text}')]
    Wait For And Click    ${opt}

Assert Toast Success
    [Arguments]    ${toast_locator}
    [Documentation]    Aguarda toast de sucesso visível.
    Wait For Elements State    ${toast_locator}    visible    timeout=${DEFAULT_TIMEOUT}

Wait For Element Present
    [Arguments]    ${locator}
    [Documentation]    Aguarda elemento presente/visível.
    Wait For Elements State    ${locator}    visible    timeout=${DEFAULT_TIMEOUT}

Wait For Element Absent
    [Arguments]    ${locator}
    [Documentation]    Aguarda elemento ausente/detached.
    Wait For Elements State    ${locator}    detached    timeout=${DEFAULT_TIMEOUT}

Assert Url Contains
    [Arguments]    ${expected}
    [Documentation]    Valida que a URL atual contém o trecho esperado.
    ${url}=    Get Url
    Should Contain    ${url}    ${expected}

Assert Element Hidden
    [Arguments]    ${locator}
    [Documentation]    Valida que elemento está oculto.
    Wait For Elements State    ${locator}    hidden    timeout=${DEFAULT_TIMEOUT}
