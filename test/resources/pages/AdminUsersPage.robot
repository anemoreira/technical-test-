*** Settings ***
Library    Browser
Resource   ../locators/admin_users.robot
Resource   ../common/util.robot


*** Keywords ***
Open Admin Users
    [Documentation]    Navega para Admin > User Management > Users de forma robusta.

    # Garante que o menu lateral carregou
    Wait For Elements State    xpath=//aside    visible    timeout=30s

    # Clica em Admin no menu lateral
    Click    xpath=//span[contains(@class,'oxd-main-menu-item-text') and normalize-space()='Admin']

    # Aguarda a barra de navegação superior aparecer
    Wait For Elements State    xpath=//nav[contains(@class,'oxd-topbar-body-nav')]    visible    timeout=20s

    # Clica em User Management
    Click    xpath=//span[normalize-space()='User Management']

    # Confirma que a tela de usuários carregou
    Wait For Elements State    ${ADD_BUTTON}    visible    timeout=30s


Create User
    [Arguments]    ${employee_name}    ${username}    ${password}    ${role}=ESS    ${status}=Enabled
    [Documentation]    Cria novo usuário

    Wait For And Click    ${ADD_BUTTON}
    Wait For Elements State    ${FORM_USER_ROLE_DROPDOWN}    visible    timeout=20s

    Select Dropdown Option       ${FORM_USER_ROLE_DROPDOWN}    ${role}
    Select Autocomplete Option   ${FORM_EMPLOYEE_NAME_INPUT}    ${employee_name}
    Select Dropdown Option       ${FORM_STATUS_DROPDOWN}    ${status}

    Input Text And Wait    ${FORM_USERNAME_INPUT}    ${username}
    Input Text And Wait    ${FORM_PASSWORD_INPUT}    ${password}
    Input Text And Wait    ${FORM_CONFIRM_PASSWORD_INPUT}    ${password}

    Wait For And Click    ${SAVE_BUTTON}
    Wait For Elements State    ${TABLE_CARD}    visible    timeout=20s


Search User By Username
    [Arguments]    ${username}
    [Documentation]    Pesquisa usuário pelo username

    Input Text And Wait    ${SEARCH_USERNAME_INPUT}    ${username}
    Wait For And Click     ${SEARCH_BUTTON}
    Wait For Elements State    ${TABLE_CARD}    visible    timeout=20s


Assert User Present
    [Arguments]    ${username}
    [Documentation]    Valida que o usuário está presente na tabela

    ${row}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space()='${username}']

    Wait For Elements State    ${row}    visible    timeout=20s


Open Edit For Username
    [Arguments]    ${username}
    [Documentation]    Abre tela de edição do usuário

    ${edit_btn}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]
    ...    //div[normalize-space()='${username}']
    ...    /ancestor::div[contains(@class,'oxd-table-card')]
    ...    //button[1]

    Wait For And Click    ${edit_btn}


Edit User Username
    [Arguments]    ${current_username}    ${new_username}
    [Documentation]    Edita o username do usuário

    Open Edit For Username    ${current_username}
    Input Text And Wait       ${FORM_USERNAME_INPUT}    ${new_username}
    Wait For And Click        ${SAVE_BUTTON}
    Wait For Elements State   ${TABLE_CARD}    visible    timeout=20s


Delete User By Username
    [Arguments]    ${username}
    [Documentation]    Exclui usuário pelo username

    ${del_btn}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]
    ...    //div[normalize-space()='${username}']
    ...    /ancestor::div[contains(@class,'oxd-table-card')]
    ...    //button[last()]

    Wait For And Click    ${del_btn}
    Wait For And Click    ${CONFIRM_DELETE_BUTTON}

    Wait Until Keyword Succeeds    5x    3s    Assert User Absent    ${username}


Assert User Absent
    [Arguments]    ${username}
    [Documentation]    Valida que o usuário não está mais na tabela

    ${row}=    Set Variable
    ...    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space()='${username}']

    Wait For Elements State    ${row}    detached    timeout=20s
