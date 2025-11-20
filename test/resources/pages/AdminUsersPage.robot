*** Settings ***
Library    Browser
Resource   ../locators/admin_users.robot
Resource   ../common/util.robot

*** Keywords ***

Open Admin Users
    [Documentation]    Acessa com segurança a aba Admin > Users no OrangeHRM.

    # Garante que o menu lateral foi carregado
    Wait For Elements State    xpath=//aside    visible    timeout=30s

    # Admin
    Wait For Elements State    ${ADMIN_MENU}    visible    timeout=30s
    Click                      ${ADMIN_MENU}

    # Users
    Wait For Elements State    ${USERS_MENU}    visible    timeout=30s
    Click                      ${USERS_MENU}

    # Tabela carregada
    Wait For Elements State    ${ADD_BUTTON}    visible    timeout=30s


Create User
    [Arguments]    ${employee_name}    ${username}    ${password}    ${role}    ${status}

    Wait For And Click            ${ADD_BUTTON}
    Wait For Elements State       ${FORM_USER_ROLE_DROPDOWN}    visible    timeout=20s

    Select Dropdown Option        ${FORM_USER_ROLE_DROPDOWN}    ${role}
    Select Autocomplete Option    ${FORM_EMPLOYEE_NAME_INPUT}   ${employee_name}
    Select Dropdown Option        ${FORM_STATUS_DROPDOWN}       ${status}

    Input Text And Wait           ${FORM_USERNAME_INPUT}         ${username}
    Input Text And Wait           ${FORM_PASSWORD_INPUT}         ${password}
    Input Text And Wait           ${FORM_CONFIRM_PASSWORD_INPUT} ${password}

    Wait For And Click            ${SAVE_BUTTON}
    Wait For Elements State       ${TABLE_CARD}                  visible    timeout=20s


Search User By Username
    [Arguments]    ${username}

    Wait For Elements State    ${SEARCH_USERNAME_INPUT}    visible    timeout=15s
    Input Text And Wait        ${SEARCH_USERNAME_INPUT}    ${username}
    Wait For And Click         ${SEARCH_BUTTON}
    Wait For Elements State    ${TABLE_CARD}               visible    timeout=20s


Assert User Present
    [Arguments]    ${username}

    ${row}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']

    Wait For Elements State    ${row}    visible    timeout=20s


Edit User Username
    [Arguments]    ${current_username}    ${new_username}

    Open Edit For Username    ${current_username}

    Wait For Elements State    ${FORM_USERNAME_INPUT}    visible    timeout=15s
    Fill Text                 ${FORM_USERNAME_INPUT}     ${new_username}

    Wait For And Click        ${SAVE_BUTTON}
    Wait For Elements State   ${TABLE_CARD}              visible    timeout=20s


Delete User By Username
    [Arguments]    ${username}

    ${del_btn}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]
    ...    //div[normalize-space(.)='${username}']
    ...    /ancestor::div[contains(@class,'oxd-table-card')]
    ...    //button[contains(@class,'oxd-icon-button')][last()]

    Wait For And Click         ${del_btn}
    Wait For Elements State    ${CONFIRM_DELETE_BUTTON}    visible    timeout=10s
    Wait For And Click         ${CONFIRM_DELETE_BUTTON}

    Wait Until Keyword Succeeds    5x    2s    Assert User Absent    ${username}


Assert User Absent
    [Arguments]    ${username}

    ${row}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']

    Wait For Elements State    ${row}    detached    timeout=20s
